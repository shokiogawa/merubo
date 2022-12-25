import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message_bord.dart';

class PreviewMessageBordBottom extends ConsumerWidget {
  final MessageBord messageBord;

  const PreviewMessageBordBottom({Key? key, required this.messageBord})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.amber), color: Colors.white30),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text("Last Message", style: TextStyle(fontSize: 20),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
              child: Text(messageBord.lastMessage ?? "unnown"),
            ),
          ],
        ));
  }
}
