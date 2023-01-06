import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/common_provider/firebase_fire_store.dart';
import 'package:merubo/model/entity/message.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/model/entity/message_bord_with_message.dart';
import 'package:merubo/model/entity/message_bord_with_messages.dart';
import 'package:merubo/model/entity/reference/own_message_bord_ref.dart';
import 'package:merubo/provider/current_user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final messageBordRepositoryProvider =
Provider((ref) => MessageBordRepository(ref));

class MessageBordRepository {
  MessageBordRepository(this.ref);

  final Ref ref;

  //自分が管理また、メッセージしたメッセージボード一覧
  Future<List<MessageBord>> fetchOwnMessageBordList(String userId,
      Role role) async {
    // ページによって変更させる。
    final List<String> whereIn = [];
    print("fetchOwnMessageBordList");
    try {
      final fireStore = ref.watch(firebaseFireStoreProvider);
      final messageBordIdListRefQuery = fireStore
          .collection("users")
          .doc(userId)
          .collection("own_message_bords")
          .where("role", whereIn: [describeEnum(role)]).withConverter(
          fromFirestore: (snapshot, _) =>
              OwnMessageBordRef.fromJson(snapshot.data()!),
          toFirestore: (messageBordRef, _) => messageBordRef.toJson());
      final messageBordListRef = await messageBordIdListRefQuery.get();
      final List<MessageBord> messageBordRealList = [];
      await Future.forEach(messageBordListRef.docs, (messageBordRef) async {
        final ref = messageBordRef.data();

        final messageBordRealRef = ref.messageBordRef.withConverter(
            fromFirestore: (snapshot, _) =>
                MessageBord.fromJson(snapshot.data()!),
            toFirestore: (messageBord, _) => messageBord.toJson());
        final messageBordRealDoc = await messageBordRealRef.get();

        final messageBordReal = messageBordRealDoc.data()!;
        messageBordRealList.add(messageBordReal);
      });
      return messageBordRealList;
    } catch (err) {
      print(err);
      throw Error();
    }
  }

  // 受け取った寄せ書き一覧を取得(メッセージ付き)
  Future<List<MessageBordWithMessages>> fetchReceiveMessageBordList() async {
    final userId = ref
        .watch(currentUserProvider)
        .id;
    final fireStore = ref.watch(firebaseFireStoreProvider);
    final List<MessageBordWithMessages> messageBordWithMessages = [];
    try {
      // userが持っている寄せ書き情報一覧を取得
      final ownMessageBordListRef = await fireStore
          .collection("users")
          .doc(userId)
          .collection("own_message_bords").where(
          'role', isEqualTo: describeEnum(Role.receiver))
          .get();
      if (ownMessageBordListRef.size == 0) {
        return messageBordWithMessages;
      }
      // documentId一覧
      final ownMessageBordDocIds =
      ownMessageBordListRef.docs.map((value) => value.id).toList();

      // 寄せ書きを受け取り日順に取得
      final messageBordQuery = fireStore
          .collection("message_bords")
          .orderBy("receivedAt", descending: true)
          .where("id", whereIn: ownMessageBordDocIds)
          .withConverter(
          fromFirestore: (snapshot, _) =>
              MessageBord.fromJson(snapshot.data()!),
          toFirestore: (messageBord, _) => messageBord.toJson());
      final messageBordSnap = await messageBordQuery.get();

      // 該当の寄せ書きを回し、紐づいているメッセージを取得
      await Future.forEach(messageBordSnap.docs, (doc) async {
        final messageQuery = fireStore
            .collection("message_bords")
            .doc(doc.id)
            .collection("messages")
            .withConverter(
            fromFirestore: (snapshot, _) =>
                Message.fromJson(snapshot.data()!),
            toFirestore: (message, _) => message.toJson());

        final messageSnap = await messageQuery.get();
        // 該当の寄せ書きに紐づいているメッセージを取得
        final messages = messageSnap.docs.map((snap) => snap.data()).toList();
        final value = MessageBordWithMessages(
            messageBord: doc.data(), messages: messages);
        messageBordWithMessages.add(value);
      });
      return messageBordWithMessages;
    } catch (err) {
      throw Exception(err);
    }
    // try {
    //   final messageBordIdListRefQuery = fireStore
    //       .collection("users")
    //       .doc(userId)
    //       .collection("own_message_bords")
    //       .where("role", whereIn: [describeEnum(Role.receiver)]).withConverter(
    //           fromFirestore: (snapshot, _) =>
    //               OwnMessageBordRef.fromJson(snapshot.data()!),
    //           toFirestore: (messageBordRef, _) => messageBordRef.toJson());
    //   final messageBordListRef = await messageBordIdListRefQuery.get();
    //
    //   await Future.forEach(messageBordListRef.docs, (messageBordRef) async {
    //     final ref = messageBordRef.data();
    //     // MessageBordデータ
    //     final messageBordRealRef = ref.messageBordRef.withConverter(
    //         fromFirestore: (snapshot, _) =>
    //             MessageBord.fromJson(snapshot.data()!),
    //         toFirestore: (messageBord, _) => messageBord.toJson());
    //     final messageBordRealDoc = await messageBordRealRef.get();
    //     final messageBordReal = messageBordRealDoc.data()!;
    //
    //     // Messageデータ
    //     final messageRealRef = ref.messageBordRef
    //         .collection("messages")
    //         .withConverter(
    //             fromFirestore: (snapshot, _) =>
    //                 Message.fromJson(snapshot.data()!),
    //             toFirestore: (message, _) => message.toJson());
    //     final messageRealDoc = await messageRealRef.get();
    //
    //     final List<Message> messagesReal = [];
    //     for (var message in messageRealDoc.docs) {
    //       messagesReal.add(message.data());
    //     }
    //     final value = MessageBordWithMessages(
    //         messageBord: messageBordReal, messages: messagesReal);
    //
    //     messageBordWithMessages.add(value);
    //   });
    //   return messageBordWithMessages;
    // } catch (err) {
    //   print(err);
    //   throw Exception(err);
    // }
  }

  //メッセージボード詳細
  Future<MessageBordWithMessages> fetchMessageBordDetail(
      String messageBordId) async {
    print("fetchMessageBordDetail");
    try {
      print(messageBordId);
      final filePath = "/message_bords/$messageBordId";
      final fireStore = ref.watch(firebaseFireStoreProvider);

      //メッセージボード取得
      final messageBordRef = fireStore.doc(filePath).withConverter(
          fromFirestore: (snapshot, _) =>
              MessageBord.fromJson(snapshot.data()!),
          toFirestore: (messageBord, _) => messageBord.toJson());
      final messageBorSnapshot = await messageBordRef.get();
      final MessageBord messageBord = messageBorSnapshot.data()!;

      // メッセージ取得
      final messageRef = fireStore
          .doc(filePath)
          .collection("messages")
          .withConverter(
          fromFirestore: (snapshot, _) =>
              Message.fromJson(snapshot.data()!),
          toFirestore: (message, _) => message.toJson());
      final messageQuery = await messageRef.get();
      final messages = messageQuery.docs.map((message) {
        return message.data();
      }).toList();

      final messageBordWithMessage =
      MessageBordWithMessages(messageBord: messageBord, messages: messages);
      return messageBordWithMessage;
    } catch (err) {
      print(err);
      throw Error();
    }
  }

  /*
    *初期メッセージボード作成メソッド
   */
  Future<void> createMessageBord(MessageBordWithMessage value) async {
    final messageBordId = value.messageBord.id;
    final messageId = value.messages.id;
    final messageBord = value.messageBord;
    final message = value.messages;

    //firestoreにデータを保存。
    final fireStore = ref.watch(firebaseFireStoreProvider);
    //batch start
    try {
      final batch = fireStore.batch();
      // 保存場所指定
      final messageBordRef =
      fireStore.collection("message_bords").doc(messageBordId);
      final messageRef = messageBordRef.collection("messages").doc(messageId);
      final userRef = fireStore
          .collection("users")
          .doc(ref
          .watch(currentUserProvider)
          .id)
          .collection("own_message_bords")
          .doc(messageBordId);
      //保存
      batch.set(userRef,
          {"messageBordRef": messageBordRef, "role": describeEnum(Role.owner)});
      batch.set(messageBordRef, messageBord.toJson());
      batch.set(messageRef, message.toJson());
      batch.commit();
    } catch (err) {
      print("ここでエラー");
      print(err);
      throw Exception(err);
    }
  }

  // メッセージボード取得
  Future<MessageBord> fetchMessageBordById(String messageBordId) async {
    final fireStore = ref.watch(firebaseFireStoreProvider);
    final messageBordRef = fireStore
        .collection("message_bords")
        .doc(messageBordId)
        .withConverter(
        fromFirestore: (snap, _) => MessageBord.fromJson(snap.data()!),
        toFirestore: (messageBord, _) => messageBord.toJson());
    final messageBordSnap = await messageBordRef.get();
    if (!messageBordSnap.exists) {
      throw Exception('Data is not exist messageBordId: $messageBordId');
    }
    return messageBordSnap.data()!;
  }

  //メッセージ取得
  Future<Message> fetchMessageByMessageBordId(String messageBordId) async {
    final fireStore = ref.watch(firebaseFireStoreProvider);
    final userId = ref
        .watch(currentUserProvider)
        .id;
    final messageRef = fireStore
        .collection("message_bords")
        .doc(messageBordId)
        .collection("messages")
        .where('userId', isEqualTo: userId)
        .withConverter(
        fromFirestore: (snap, _) => Message.fromJson(snap.data()!),
        toFirestore: (message, _) => message.toJson());
    final messageSnap = await messageRef.get();
    if (messageSnap.docs.isEmpty) {
      throw Exception(
          'Message Data is not exist in messageBordId: $messageBordId');
    }
    return messageSnap.docs.first.data();
  }

  //メッセージボード更新
  Future<void> updateMessageBord(MessageBord messageBord) async {
    print(messageBord.id);
    final fireStore = ref.watch(firebaseFireStoreProvider);
    try {
      await fireStore
          .collection("message_bords")
          .doc(messageBord.id)
          .update(messageBord.toJson());
    } catch (err) {
      throw Exception(err);
    }
  }

  // メッセージ更新
  Future<void> updateMessage(String messageBordId, Message message) async {
    final fireStore = ref.watch(firebaseFireStoreProvider);
    await fireStore
        .collection("message_bords")
        .doc(messageBordId)
        .collection("messages")
        .doc(message.id)
        .update(message.toJson());
  }

  //メッセージボード削除
  Future<void> deleteMessageBord() async {}

  // 寄せ書きが存在しているかチェック
  Future<bool> checkIsExistMessageBord(String messageBordId) async {
    try {
      final fireStore = ref.watch(firebaseFireStoreProvider);
      final isExistMessageBord =
          (await fireStore.collection("message_bords").doc(messageBordId).get())
              .exists;
      return isExistMessageBord;
    } catch (err) {
      throw Exception(err);
    }
  }

  // 寄せ書きをすでに取得しているかどうかのチェック
  Future<bool> checkHasMessageBord(String messageBordId) async {
    final userId = ref
        .watch(currentUserProvider)
        .id;
    try {
      final fireStore = ref.watch(firebaseFireStoreProvider);
      final hasMessageBord = (await fireStore
          .collection("users")
          .doc(userId)
          .collection("own_message_bords")
          .doc(messageBordId)
          .get())
          .exists;
      return hasMessageBord;
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<void> registerMessageBordOnlineOrPaper(MessageBord messageBord) async {
    final share = await SharedPreferences.getInstance();
    final messageBordJson = jsonEncode(messageBord.toJson());
    final result = share.getStringList('messageBordList') ?? [];
    result.add(messageBordJson);

    await share.setStringList('messageBordList', result);
    // final currentResultList = result.map((value) =>
    //     MessageBord.fromJson(jsonDecode(value))).toList();

  }

  // メッセージボードを受取人が登録
  Future<void> registerMessageBord(String messageBordId) async {
    final fireStore = ref.watch(firebaseFireStoreProvider);
    final userId = ref
        .watch(currentUserProvider)
        .id;
    try {
      if (await checkIsExistMessageBord(messageBordId) &&
          !await checkHasMessageBord(messageBordId)) {
        final batch = fireStore.batch();
        final messageBordRef =
        fireStore.collection("message_bords").doc(messageBordId);
        final userRef = fireStore
            .collection("users")
            .doc(userId)
            .collection("own_message_bords")
            .doc(messageBordId);
        batch.update(messageBordRef,
            { 'receivedAt': Timestamp.fromDate(DateTime.now()),
              'status': describeEnum(Status.send)
            }
        );
        batch.set(userRef, {
          "messageBordRef": messageBordRef,
          "role": describeEnum(Role.receiver)
        });
        batch.commit();
      } else {
        throw Exception(
            'MessageBordId $messageBordId is not exist or has already had ');
      }
    } catch (err) {
      throw Exception(err);
    }
  }
}
