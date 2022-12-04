import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widget/bottom_button.dart';

class CreateBottomMessagePage extends ConsumerWidget {
  const CreateBottomMessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text("まとめメッセージ"),
                      ),
                      TextField(
                        maxLines: 8,
                        decoration: InputDecoration(
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
        const BottomButton()
      ],
    );
  }
}
