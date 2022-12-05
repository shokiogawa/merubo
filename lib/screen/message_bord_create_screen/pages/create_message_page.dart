import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/screen/message_bord_create_screen/widget/bottom_button.dart';
import '../../../provider/create_message_bord_provider.dart';

class CreateMessagePage extends ConsumerWidget {
  const CreateMessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createTopMessageProvider = ref.read(createMessageBord.notifier);
    final yourNameController = TextEditingController();
    final messageController = TextEditingController();
    final thumbnailController = TextEditingController();
    final voiceMessageController = TextEditingController();
    final imageController = TextEditingController();

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
                    children: [
                      // 自分の名前
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text("あなたのお名前"),
                      ),
                      TextField(
                        controller: yourNameController,
                        decoration: const InputDecoration(
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
                    children: [
                      // 自分の名前
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text("あなたの写真(任意)"),
                      ),
                      TextField(
                        controller: thumbnailController,
                        decoration: const InputDecoration(
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
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text("メッセージ"),
                      ),
                      TextField(
                        controller: messageController,
                        maxLines: 10,
                        decoration: const InputDecoration(
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
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text("音声メッセージ(任意)"),
                      ),
                      TextField(
                        controller: voiceMessageController,
                        decoration: const InputDecoration(
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
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text("写真(任意)"),
                      ),
                      TextField(
                        controller: imageController,
                        decoration: const InputDecoration(
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
        BottomButton(onPressed: () {
          createTopMessageProvider.setMessage(
              yourNameController.text,
              thumbnailController.text,
              messageController.text,
              voiceMessageController.text);
        })
      ],
    );
  }
}
