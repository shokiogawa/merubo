import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/edit_message_bord_provider.dart';

class MessageBordEditScreen extends ConsumerWidget {
  const MessageBordEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final messageBordId = ModalRoute.of(context)!.settings.arguments as String;
    final messageBord = ref.watch(editMessageBordProvider.select((value) => value.messageBord));
    ref.watch(editMessageBordProvider.notifier).fetchMessageBord(messageBordId);
    final receiverUserController = ref.watch(editMessageBordProvider.notifier).receiverUserNameController;
    final titleController = ref.watch(editMessageBordProvider.notifier).titleController;
    return Scaffold(
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
                            initialValue: messageBord.receiverUserName,
                            controller: receiverUserController,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "名前は必須項目です";
                              }
                              if (value.length > 20) {
                                return "20文字以下でご入力ください";
                              }
                              return null;
                            },
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
                            initialValue: messageBord.title,
                            controller: titleController,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "初めのメッセージは必須項目です";
                              }
                              if (value.length > 20) {
                                return "初めのメッセージは20文字以内でご入力ください";
                              }
                              return null;
                            },
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
