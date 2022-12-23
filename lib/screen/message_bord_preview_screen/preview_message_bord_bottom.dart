import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message_bord.dart';

class PreviewMessageBordBottom extends ConsumerWidget {
  final MessageBord messageBord;

  const PreviewMessageBordBottom({Key? key, required this.messageBord})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 200,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.amber), color: Colors.white30),
          child: Center(child: Text(messageBord?.lastMessage ?? "unnown"))),
    );
  }
}
