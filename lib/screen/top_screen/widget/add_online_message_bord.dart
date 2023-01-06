import 'package:flutter/material.dart';
import 'package:merubo/widgets/button.dart';
import 'package:merubo/widgets/date_form.dart';
import 'package:merubo/widgets/text_form.dart';

class AddOnlineMessageBord extends StatelessWidget {
  const AddOnlineMessageBord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Column(
      children: [
        Form(
            key: formKey,
            child: Column(
              children: [
                const TextForm(
                  label: "寄せ書きのURLを入力",
                  hintText: "https://merubo.com/yosegaki",
                ),
                const SizedBox(height: 20),
                const TextForm(
                  label: "誰から受け取りましたか？",
                  hintText: "名前",
                ),
                const SizedBox(height: 20),
                const TextForm(
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
        Button(text: "登録", buttonColor: Colors.orangeAccent, onPressed: () {})
      ],
    );
  }
}
