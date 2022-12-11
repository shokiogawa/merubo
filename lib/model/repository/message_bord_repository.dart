import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/common_provider/firebase_fire_storage.dart';
import 'package:merubo/model/common_provider/firebase_fire_store.dart';
import 'package:merubo/model/entity/message.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/model/entity/message_bord_with_message.dart';
import 'package:merubo/model/entity/message_bord_with_messages.dart';
import 'package:merubo/model/entity/reference/own_message_bord_ref.dart';
import 'package:uuid/uuid.dart';

final messageBordRepositoryProvider =
    Provider((ref) => MessageBordRepository(ref));

class MessageBordRepository {
  MessageBordRepository(this.ref);

  final Ref ref;

  //自分が管理また、メッセージしたメッセージボード一覧
  Future<List<MessageBord>> fetchOwnMessageBordList(String userId) async {
    // ページによって変更させる。
    final List<String> whereIn = [];
    print("fetchOwnMessageBordList");
    try {
      final fireStore = ref.watch(firebaseFireStoreProvider);
      final messageBordIdListRefQuery = fireStore
          .collection("users")
          .doc(userId)
          .collection("own_message_bords")
          .where("role", whereIn: ["owner", "receiver"]).withConverter(
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
        final messageBordReal =
            messageBordRealDoc.data()!.copyWith(role: ref.role);
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

  //メッセージボード作成
  Future<void> createMessageBord(MessageBordWithMessage value) async {
    // final thumbnail = await uploadImageToStorage(imageFile, 'message_bords/$messageBordUuid/thumbnail');
    // objectに挿入
    print(value.messages.toJson());
    print(value.messageBord.toJson());
    final messageBord = value.messageBord;
    final message = value.messages;

    final fireStore = ref.watch(firebaseFireStoreProvider);
    //batch start
    final batch = fireStore.batch();
    // 保存場所指定
    final messageBordRef =
        fireStore.collection("message_bords").doc(messageBord.id);
    final messageRef = messageBordRef.collection("messages").doc(message.id);
    //保存
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
    // message_bords/{message_bord_id}/thumbnail
    final uuid = const Uuid().v4();
    final storagePath = '$path/$uuid';
    final storageRef =
        ref.watch(fireBaseFireStorageProvider).child(storagePath);
    final uploadTask = storageRef.putFile(imageFile);
    return await uploadTask.snapshot.ref.getDownloadURL();
  }

  //メッセージボード更新
  Future<void> updateMessageBord() async {}

  //メッセージボード削除
  Future<void> deleteMessageBord() async {}
}
