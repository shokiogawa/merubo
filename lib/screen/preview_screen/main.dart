import 'package:flutter/material.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/screen/preview_screen/preview_message_bord_bottom.dart';
import 'package:merubo/screen/preview_screen/preview_message_bord_message_area.dart';
import 'package:merubo/screen/preview_screen/preview_message_bord_top.dart';

class PreviewMessageBordScreen extends StatelessWidget {
  const PreviewMessageBordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            PreviewMessageBordTop(type: MessageBordType.type1),
            PreviewMessageBordMessageArea(type: MessageBordType.type1),
            PreviewMessageBordBottom(type: MessageBordType.type1)
          ],
        ),
      ),
    );
  }
}
