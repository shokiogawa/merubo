import 'package:flutter/material.dart';
import 'package:merubo/widgets/button.dart';
import 'package:merubo/widgets/image_form.dart';
import 'package:merubo/widgets/text_form.dart';

class AddPaperMessageBord extends StatelessWidget {
  const AddPaperMessageBord({Key? key}) : super(key: key);

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
                  label: "誰から受け取りましたか？",
                  hintText: "名前",
                ),
                const SizedBox(height: 20),
                const TextForm(
                  label: "なんのお祝いですか？",
                  hintText: "高校卒業、部活引退など",
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("受け取り日"),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () async {
                        final DateTime? selectedDate = await showDatePicker(
                            locale: const Locale("ja"),
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4.0)),
                            border: Border.all(color: Colors.grey)),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "yyyy年MM月DD日",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ImageForm(
                  coverText: "写真",
                  label: "寄せ書きの写真",
                  onChange: (value) {
                    print(value);
                  },
                ),
              ],
            )),
        Button(text: "登録", buttonColor: Colors.orangeAccent, onPressed: () {})
      ],
    );
  }
}
