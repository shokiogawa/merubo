import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/query/message_bord_provider.dart';
import 'package:merubo/screen/message_bord_preview_screen/widget/preview_message_bord_bottom.dart';
import 'package:merubo/screen/message_bord_preview_screen/widget/preview_message_bord_message_area.dart';
import 'package:merubo/screen/message_bord_preview_screen/widget/preview_message_bord_top.dart';

class PreviewMessageBordScreen extends ConsumerWidget {
  const PreviewMessageBordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageBordId = ModalRoute.of(context)!.settings.arguments as String;
    final asyncValue = ref.watch(messageBordDetailProvider(messageBordId));
    return Scaffold(
      body: SingleChildScrollView(
          child: asyncValue.when(data: (data) {
        return Column(
          children: [
            PreviewMessageBordTop(
              messageBord: data.messageBord,
            ),
            PreviewMessageBordMessageArea(messages: data.messages),
            PreviewMessageBordBottom(messageBord: data.messageBord)
          ],
        );
      }, error: (err, _) {
        Navigator.of(context).pop();
        throw Exception(err);
      }, loading: () {
        return const Center(child: CircularProgressIndicator());
      })),
    );
  }
}
