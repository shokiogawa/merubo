import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageBordBottom extends ConsumerWidget {
  const MessageBordBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 200,
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.amber), color: Colors.white30),
          child: const Center(child: Text("最後のメッセージ"))),
    );
  }
}
