import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message.dart';
import 'package:merubo/widgets/message_card.dart';

class PreviewMessageBordMessageArea extends ConsumerWidget {
  final List<Message> messages;
  const PreviewMessageBordMessageArea({Key? key, required this.messages})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 50),
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
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageCard(message: messages[index]);
              }),
        ],
      ),
    );
  }
}
