import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/repository/message_bord_repository.dart';
import 'package:merubo/provider/create_message_bord_provider.dart';
import '../widget/bottom_button.dart';

class CreateBottomMessagePage extends ConsumerWidget {
  const CreateBottomMessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createTopMessageProvider = ref.read(createMessageBord.notifier);
    final lastMessageController = TextEditingController();
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
                    "まとめメッセージ",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  //最後のメッセージ
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text("まとめメッセージ"),
                      ),
                      TextField(
                        controller: lastMessageController,
                        maxLines: 8,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(0),
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
          print("こんにちは");
          createTopMessageProvider.setLastMessage(lastMessageController.text);
          createTopMessageProvider.createMessageBordWithMessage();
        })
      ],
    );
  }
}
