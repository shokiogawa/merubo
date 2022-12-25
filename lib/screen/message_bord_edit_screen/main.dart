import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/create_message_bord_provider.dart';
import 'package:merubo/provider/edit_message_bord_provider.dart';
import 'package:merubo/utility/show_progress_dialog.dart';
import 'package:merubo/widgets/button.dart';

class MessageBordEditScreen extends ConsumerWidget {
  const MessageBordEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final basicFormKey = GlobalKey<FormState>();
    final messageBordId = ModalRoute.of(context)!.settings.arguments as String;
    ref.watch(editMessageBordProvider.notifier).fetchMessageBord(messageBordId);
    final receiverUserController =
        ref.watch(editMessageBordProvider.notifier).receiverUserNameController;
    final titleController =
        ref.watch(editMessageBordProvider.notifier).titleController;
    final lastMessageController =
        ref.watch(editMessageBordProvider.notifier).lastMessageController;
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40, right: 20, left: 20),
        child: Button(
            height: 50,
            text: "更新",
            buttonColor: Colors.green,
            onPressed: () async {
              if (basicFormKey.currentState!.validate()) {
                showProgressDialog(
                    context: context,
                    onPressed: () async {
                      ref.read(progressIndicatorProvider.notifier).state = true;
                      await ref
                          .read(editMessageBordProvider.notifier)
                          .updateMessageBord()
                          .then((value) {
                        ref.read(progressIndicatorProvider.notifier).state =
                            false;
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      });
                    },
                    inProgressText: '更新中',
                    confirmText: '更新しますか？',
                    buttonText: '更新');
              }
            }),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Form(
                key: basicFormKey,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
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
                              hintText: "小川 翔生",
                              hintStyle: TextStyle(fontSize: 12),
                              border: OutlineInputBorder()),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
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
                    // まとめメッセージ
                    const SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text("まとめメッセージ"),
                        ),
                        TextFormField(
                          controller: lastMessageController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'まとめメッセージは必須項目です';
                            }
                            if (value.length > 300) {
                              return "まとめメッセージは300文字以内に収めてください";
                            }
                            return null;
                          },
                          maxLines: 8,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(20),
                              hintStyle: TextStyle(fontSize: 12),
                              border: OutlineInputBorder()),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
