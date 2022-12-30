import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/screen/message_bord_create_screen/widget/bottom_button.dart';
import 'package:merubo/screen/message_bord_create_screen/widget/progress_app_bar.dart';
import 'package:merubo/widgets/text_form.dart';
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
      appBar: const ProgressAppBar(currentIndex: 1),
      bottomNavigationBar: BottomButton(onPressed: () {
        if (formKey.currentState!.validate()) {
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
                      TextForm(
                        controller: receiveUserController,
                        label: "お名前",
                        subLabel: "寄せ書きを送る相手のお名前を書きましょう",
                        hintText: "小川翔生",
                        prefixIcon: const Icon(Icons.person),
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return "名前は必須項目です";
                          }
                          if (value.length > 20) {
                            return "20文字以下でご入力ください";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 50),
                      //初めのメッセージは？
                      TextForm(
                        controller: titleMessageController,
                        label: "初めのメッセージ",
                        subLabel: "初めのメッセージを記入しましょう",
                        hintText: "ご結婚おめでとうございます。など",
                        prefixIcon: const Icon(Icons.message),
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return "初めのメッセージは必須項目です。";
                          }
                          if (value.length > 20) {
                            return "初めのメッセージは20文字以内でご入力ください";
                          }
                          return null;
                        },
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
