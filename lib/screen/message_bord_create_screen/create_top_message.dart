import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/screen/message_bord_create_screen/widget/bottom_button.dart';
import 'package:merubo/screen/message_bord_create_screen/widget/progress_app_bar.dart';
import '../../provider/create_message_bord_provider.dart';

class CreateTopMessageScreen extends ConsumerWidget {
  CreateTopMessageScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createTopMessageProvider =
        ref.watch(createMessageBordProvider.notifier);
    final receiveUserController =
        createTopMessageProvider.receiverUserNameController;
    final titleMessageController =
        createTopMessageProvider.titleMessageController;
    return Scaffold(
      appBar: const ProgressAppBar(),
      bottomNavigationBar: BottomButton(onPressed: () {
        if (formKey.currentState!.validate()) {
          ref.read(currentIndexProviderForCreate.notifier).state = 2;
          Navigator.of(context)
              .pushNamed('/message_bord_create_message_screen');
        }
      }),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Form(
                  key: formKey,
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
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text("お名前"),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text(
                              "寄せ書きを送る相手のお名前を書きましょう",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "名前は必須項目です";
                              }
                              if (value.length > 20) {
                                return "20文字以下でご入力ください";
                              }
                            },
                            controller: receiveUserController,
                            decoration: const InputDecoration(
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
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text("初めのメッセージ"),
                          ),
                          const Text(
                            "初めのメッセージを記入しましょう",
                            style: TextStyle(fontSize: 12),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text(
                              "※20文字までです。",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "初めのメッセージは必須項目です";
                              }
                              if (value.length > 20) {
                                return "初めのメッセージは20文字以内でご入力ください";
                              }
                            },
                            controller: titleMessageController,
                            decoration: const InputDecoration(
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
