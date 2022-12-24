import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/common_provider/firebase_fire_storage.dart';
import 'package:merubo/model/common_provider/firebase_fire_store.dart';
import 'package:merubo/model/entity/message.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/model/entity/message_bord_with_message.dart';
import 'package:merubo/model/entity/message_bord_with_messages.dart';
import 'package:merubo/model/entity/reference/own_message_bord_ref.dart';
import 'package:merubo/provider/current_user_provider.dart';
import 'package:uuid/uuid.dart';

final messageBordRepositoryProvider =
    Provider((ref) => MessageBordRepository(ref));

class MessageBordRepository {
  MessageBordRepository(this.ref);

  final Ref ref;

  //自分が管理また、メッセージしたメッセージボード一覧
  Future<List<MessageBord>> fetchOwnMessageBordList(
      String userId, Role role) async {
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

  //自分が受け取ったメッセージボード一覧
  Future<List<MessageBord>> fetchReceiveMessageBordList(String userId) async {
    print("fetchReceiveMessageBordList");
    final List<MessageBord> messageBordList = [];
    return messageBordList;
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
    *メッセージボード作成メソッド。
   */
  Future<void> createMessageBord(MessageBordWithMessage value) async {
    final messageBordId = value.messageBord.id;
    final messageId = value.messages.id;

    //firestorageに画像を保存
    try {
      if (value.messages.thumbnail != null) {
        print("thumbnail作成開始");
        await uploadImageToStorage(File(value.messages.thumbnail!),
                'message_bords/$messageBordId/messages/$messageId/thumbnail')
            .then((thumbnail) {
          final newMessage = value.messages.copyWith(thumbnail: thumbnail);
          value = value.copyWith(messages: newMessage);
          print("thumbnail作成完了");
        }).catchError((err) {
          print("thumbnail作成失敗");
          print(err);
        });
      }

      if (value.messages.image != null) {
        print("image作成開始");
        await uploadImageToStorage(File(value.messages.image!),
                'message_bords/$messageBordId/messages/$messageId/image')
            .then((image) {
          final newMessage = value.messages.copyWith(image: image);
          value = value.copyWith(messages: newMessage);
          print("image作成完了");
        }).catchError((err) {
          print("image作成失敗");
          print(err);
        });
      }

      if (value.messages.voiceMessage != null) {
        print("voiceMessage作成開始");
        await uploadImageToStorage(File(value.messages.voiceMessage!),
                'message_bords/$messageBordId/messages/$messageId/voiceMessage')
            .then((voiceMessage) {
          final newMessage =
              value.messages.copyWith(voiceMessage: voiceMessage);
          value = value.copyWith(messages: newMessage);
          print("voiceMessage作成完了");
        }).catchError((err) {
          print("voiceMessage作成失敗");
          print(err);
        });
      }

      if (value.messageBord.lastPicture != null) {
        print("lastPicture作成開始");
        await uploadImageToStorage(File(value.messageBord.lastPicture!),
                'message_bords/$messageBordId/lastPicture')
            .then((lastPicture) {
          final newMessageBord =
              value.messageBord.copyWith(lastPicture: lastPicture);
          value = value.copyWith(messageBord: newMessageBord);
          print("lastPicture作成完了");
        }).catchError((err) {
          print("lastPicture作成失敗");
          print(err);
        });
      }

      if (value.messageBord.lastMovie != null) {
        print("lastMovie作成開始");
        await uploadImageToStorage(File(value.messageBord.lastMovie!),
                'message_bords/$messageBordId/lastMovie')
            .then((lastMovie) {
          print("lastMovie作成完了");
          final newMessageBord =
              value.messageBord.copyWith(lastMovie: lastMovie);
          value = value.copyWith(messageBord: newMessageBord);
        }).catchError((err) {
          print("lastMovie作成失敗");
          print(err);
        });
      }
    } catch (error) {
      throw Exception("画像送信で失敗しました。");
    }

    final messageBord = value.messageBord;
    final message = value.messages;

    //firestoreにデータを保存。
    final fireStore = ref.watch(firebaseFireStoreProvider);
    //batch start
    final batch = fireStore.batch();
    // 保存場所指定
    final messageBordRef =
        fireStore.collection("message_bords").doc(messageBordId);
    final messageRef = messageBordRef.collection("messages").doc(messageId);
    final userRef = fireStore
        .collection("users")
        .doc(ref.watch(currentUserProvider).id)
        .collection("own_message_bords")
        .doc(messageBordId);
    //保存
    batch.set(userRef,
        {"messageBordRef": messageBordRef, "role": Role.owner.toString()});
    batch.set(messageBordRef, messageBord.toJson());
    batch.set(messageRef, message.toJson());
    batch.commit().then((value) {
      print("succeed commit");
    }).catchError((err) {
      print(err);
      print("failed set data");
      throw Exception(err);
    });
  }

  Future<String> uploadImageToStorage(File imageFile, String path) async {
    try {
      // message_bords/{message_bord_id}/thumbnail
      final uuid = const Uuid().v4();
      final storagePath = '$path/$uuid';
      final storageRef =
          ref.watch(fireBaseFireStorageProvider).child(storagePath);
      final uploadTask = await storageRef.putFile(imageFile);
      final url = await uploadTask.ref.getDownloadURL();
      return url;
    } catch (err) {
      print(err);
      throw Exception('$pathが保存できませんでした。');
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
    final userId = ref.watch(currentUserProvider).id;
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
    final fireStore = ref.watch(firebaseFireStoreProvider);
    await fireStore
        .collection("message_bords")
        .doc(messageBord.id)
        .update(messageBord.toJson());
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
}
