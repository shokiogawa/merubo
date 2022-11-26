import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:merubo/model/provider/auth_provider.dart';
import 'message_bord_bottom.dart';
import 'message_bord_message_area.dart';
import 'message_bord_top.dart';

class MessageBordScreen extends ConsumerWidget {
  const MessageBordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
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
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  final user = await users.doc('JewDzzfttNl8algHI7j0').get();
  print(user.data());
}
