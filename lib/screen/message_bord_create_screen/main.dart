import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/screen/message_bord_create_screen/pages/choose_template_page.dart';

class MessageBordCreateScreen extends ConsumerWidget {
  const MessageBordCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: const ChooseTemplatePage(),
    );
  }
}
