import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'message_bord_bottom.dart';
import 'message_bord_message_area.dart';
import 'message_bord_top.dart';

class MessageBordScreen extends ConsumerWidget {
  const MessageBordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await test();
      }),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            MessageBordTop(),
            //寄せ書きを表示部分
            MessageBordMessageArea(),
            //最後のメッセージ部分(動画、画像)
            MessageBordBottom()
          ],
        ),
      ),
    );
  }
}

Future<void> test() async {

  // 受け取ったメッセージボード一覧を取得
  // final messageBordRef = FirebaseFirestore.instance
  //     .collection("message_bords")
  //     .where("receiverUserId", isEqualTo: "JewDzzfttNl8algHI7j0")
  //     .withConverter<MessageBord>(
  //         fromFirestore: (snapshot, _) =>
  //             MessageBord.fromJson(snapshot.data()!),
  //         toFirestore: (messageBord, _) => messageBord.toJson());
  // final messageBorSnapshot = await messageBordRef.get();
  // final MessageBord messageBord = messageBorSnapshot.docs[0].data();
  // final messageBordDocId = messageBorSnapshot.docs[0].id;
  // print(messageBord.receiverUserName);

  //自分が作成したメッセージボード一覧を取得
  final messageBordRef2 = FirebaseFirestore.instance
      .collection("message_bords")
      .where("ownerUserId", isEqualTo: "JewDzzfttNl8algHI7j0")
      .withConverter<MessageBord>(
          fromFirestore: (snapshot, _) =>
              MessageBord.fromJson(snapshot.data()!),
          toFirestore: (messageBord, _) => messageBord.toJson());
  final messageBorSnapshot2 = await messageBordRef2.get();
  final MessageBord messageBord2 = messageBorSnapshot2.docs[0].data();
  final messageBordDocId2 = messageBorSnapshot2.docs[0].id;
  print(messageBord2);

  //messageBordIdをもとに、メッセージを取得
  final messagesRef = FirebaseFirestore.instance
      .collection("messages")
      .where("messageBordId", isEqualTo: messageBordDocId2)
      .withConverter<Message>(
          fromFirestore: (snapshot, _) => Message.fromJson(snapshot.data()!),
          toFirestore: (message, _) => message.toJson());
  final messageSnapshot = await messagesRef.get();
  for (var element in messageSnapshot.docs) {
    print(element.data().content);
  }
}
