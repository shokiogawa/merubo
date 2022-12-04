import 'package:flutter/material.dart';

class ProgressCircle extends StatelessWidget {
  const ProgressCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 18,
      backgroundColor: Colors.white,
      child: Icon(Icons.check),
    );
  }
}
