import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/create_message_bord_provider.dart';
import 'package:merubo/screen/message_bord_create_screen/widget/progress_app_bar.dart';
import 'widget/bottom_button.dart';

class CreateBottomMessageScreen extends ConsumerWidget {
  const CreateBottomMessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createTopMessageProvider = ref.read(createMessageBord.notifier);
    final lastMessageController = TextEditingController();
    return Scaffold(
      appBar: const ProgressAppBar(),
      body: Column(
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
            ref.read(currentIndexProviderForCreate.notifier).state = 4;
            createTopMessageProvider.setLastMessage(lastMessageController.text);
            // TODO: firestoreのルールを作成するまでコメントアウトしておく。
            // createTopMessageProvider.createMessageBordWithMessage();
            Navigator.of(context).pushNamedAndRemoveUntil('/message_bord_complete_message_bord_screen', (route) => false);
          })
        ],
      ),
    );
  }
}