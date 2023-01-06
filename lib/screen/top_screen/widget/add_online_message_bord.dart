import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/register_message_bord_provider.dart';
import 'package:merubo/widgets/button.dart';
import 'package:merubo/widgets/date_form.dart';
import 'package:merubo/widgets/text_form.dart';

class AddOnlineMessageBord extends ConsumerWidget {
  const AddOnlineMessageBord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final urlController = ref.watch(registerMessageBordProvider).urlController;
    final nameController =
        ref.watch(registerMessageBordProvider).nameController;
    final categoryController =
        ref.watch(registerMessageBordProvider).categoryController;

    final formKey = GlobalKey<FormState>();
    return Column(
      children: [
        Form(
            key: formKey,
            child: Column(
              children: [
                TextForm(
                  controller: urlController,
                  label: "寄せ書きのURLを入力",
                  hintText: "https://merubo.com/yosegaki",
                ),
                const SizedBox(height: 20),
                TextForm(
                  controller: nameController,
                  label: "誰から受け取りましたか？",
                  hintText: "名前",
                ),
                const SizedBox(height: 20),
                TextForm(
                  controller: categoryController,
                  label: "なんのお祝いですか？",
                  hintText: "高校卒業、部活引退など",
                ),
                const SizedBox(height: 20),
                DateForm(
                  label: "受け取り日",
                  onSelected: (value) {
                    print(value);
                  },
                ),
                const SizedBox(height: 20),
              ],
            )),
        Button(
            text: "登録",
            buttonColor: Colors.orangeAccent,
            onPressed: () async {
              await ref
                  .read(registerMessageBordProvider)
                  .registerOnlineOrPaper();
            })
      ],
    );
  }
}
