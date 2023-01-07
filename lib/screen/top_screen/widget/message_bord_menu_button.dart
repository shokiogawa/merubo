import 'package:flutter/material.dart';

class MessageBordMenuButton extends StatelessWidget {
  const MessageBordMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.more_vert_rounded,
        size: 20,
      ),
    );
  }
}
