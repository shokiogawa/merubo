import 'package:flutter/material.dart';
import 'package:merubo/model/entity/message_bord.dart';
class Type1Template extends StatelessWidget {
  const Type1Template({Key? key, required this.messageBord}) : super(key: key);
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
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
            // テンプレートごとのタイトル(widgetごとの作成の方が良いかも)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Congraturation !!",
                style: TextStyle(color: Colors.amberAccent, fontSize: 45),
              ),
            ),
            // 寄せ書きタイトルメッセージ
            Text(
              messageBord.title ?? "unnown",
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ));
  }
}