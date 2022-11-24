import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/pages/message_bord/message_bord_bottom.dart';
import 'package:merubo/pages/message_bord/message_bord_message_area.dart';
import 'package:merubo/pages/message_bord/message_bord_top.dart';

class MessageBordPage extends ConsumerWidget {
  const MessageBordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await test()
            .then((value) => print("成功"))
            .catchError((error) => {print(error)});
        print("やあ");
      }),
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
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  final user = await users.doc('JewDzzfttNl8algHI7j0').get();
  print(user.data());
}
