import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/create_message_bord_provider.dart';
import 'package:merubo/screen/message_bord_create_screen/widget/bottom_button.dart';

class CreateTopMessagePage extends ConsumerWidget {
  const CreateTopMessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("CreateTopMessagePage");
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              "基本情報",
              style: TextStyle(fontSize: 20),
            ),
            //誰に送るのか？
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text("お名前"),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    "寄せ書きを送る相手のお名前を書きましょう",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      contentPadding: EdgeInsets.all(0),
                      hintText: "〇〇さん",
                      hintStyle: TextStyle(fontSize: 12),
                      border: OutlineInputBorder()),
                ),
              ],
            ),
            const SizedBox(height: 50),
            //初めのメッセージは？
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text("初めのメッセージ"),
                ),
                Text(
                  "初めのメッセージを記入しましょう",
                  style: TextStyle(fontSize: 12),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    "※20文字までです。",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.message),
                      contentPadding: EdgeInsets.all(0),
                      hintText: "ご結婚おめでとうございます。など",
                      hintStyle: TextStyle(fontSize: 12),
                      border: OutlineInputBorder()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
