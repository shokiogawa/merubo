import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/screen/message_bord_create_screen/widget/bottom_button.dart';

class CreateMessagePage extends ConsumerWidget {
  const CreateMessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    "あなたからのメッセージ作成",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //自分の名前
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      // 自分の名前
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text("あなたのお名前"),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            contentPadding: EdgeInsets.all(0),
                            hintStyle: TextStyle(fontSize: 12),
                            border: OutlineInputBorder()),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      // 自分の名前
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text("あなたの写真(任意)"),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.face),
                            contentPadding: EdgeInsets.all(0),
                            hintStyle: TextStyle(fontSize: 12),
                            border: OutlineInputBorder()),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text("メッセージ"),
                      ),
                      TextField(
                        maxLines: 10,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            hintStyle: TextStyle(fontSize: 12),
                            border: OutlineInputBorder()),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //音声メッセージ
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text("音声メッセージ(任意)"),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.voice_chat),
                            contentPadding: EdgeInsets.all(0),
                            hintText: "音声メッセージ",
                            hintStyle: TextStyle(fontSize: 12),
                            border: OutlineInputBorder()),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text("写真(任意)"),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.photo_album),
                            contentPadding: EdgeInsets.all(0),
                            hintText: "写真を選択",
                            hintStyle: TextStyle(fontSize: 12),
                            border: OutlineInputBorder()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const BottomButton()
      ],
    );
  }
}
