import 'package:flutter/material.dart';
import 'package:merubo/model/entity/message_bord.dart';
class Type2Template extends StatelessWidget {
  const Type2Template({Key? key, required this.messageBord}) : super(key: key);
  final MessageBord messageBord;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 送り相手
            Text(
              messageBord.receiverUserName ?? "unnown",
              style: const TextStyle(fontSize: 15),
            ),
            // テンプレートごとのタイトル(widgetごとの作成の方が良いかも)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Text(
                "Happy New Year !!",
                style: TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
              ),
            ),
            // 寄せ書きタイトルメッセージ
            Text(
              messageBord.title ?? "unnown",
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ));
  }
}