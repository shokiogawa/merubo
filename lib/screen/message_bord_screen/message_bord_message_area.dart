import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/message_item_left.dart';
import '../../widgets/message_item_right.dart';

class MessageBordMessageArea extends ConsumerWidget {
  const MessageBordMessageArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 5),
          color: Colors.white24),
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  color: Colors.white),
              child: const Text(
                "Messaging Bord",
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.double),
              )),
          ListView.builder(
              padding: const EdgeInsets.only(top: 0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 40,
              itemBuilder: (context, index) {
                if (index % 2 == 1) {
                  return const MessageItemLeft();
                } else {
                  return const MessageItemRight();
                }
              }),
        ],
      ),
    );
  }
}
