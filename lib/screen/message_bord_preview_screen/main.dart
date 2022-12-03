import 'package:flutter/material.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/screen/message_bord_preview_screen/preview_message_bord_bottom.dart';
import 'package:merubo/screen/message_bord_preview_screen/preview_message_bord_message_area.dart';
import 'package:merubo/screen/message_bord_preview_screen/preview_message_bord_top.dart';

class PreviewMessageBordScreen extends StatelessWidget {
  const PreviewMessageBordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final type = ModalRoute.of(context)!.settings.arguments as MessageBordType;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PreviewMessageBordTop(type: type),
            PreviewMessageBordMessageArea(type: type),
            PreviewMessageBordBottom(type: type)
          ],
        ),
      ),
    );
  }
}
