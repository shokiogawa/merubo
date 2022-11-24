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
      floatingActionButton: FloatingActionButton(onPressed: () {
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
