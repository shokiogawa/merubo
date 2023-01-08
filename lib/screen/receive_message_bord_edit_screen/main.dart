import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/command/edit_receive_message_bord_provider.dart';
import 'package:merubo/widgets/date_form.dart';
import 'package:merubo/widgets/text_form.dart';

class ReceiveMessageBordEditScreen extends ConsumerWidget {
  final String year;
  final String messageBordId;

  ReceiveMessageBordEditScreen(
      {Key? key, required this.year, required this.messageBordId})
      : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(editReceiveMessageBordProvider);
    final urlController = provider.urlController;
    final userController = provider.userController;
    final categoryController = provider.categoryController;
    Future((){
      provider.getTargetMessageBord(year, messageBordId);
    });
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "編集",
        style: TextStyle(color: Colors.white),
      )),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
              color: Colors.white,
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextForm(
                        label: "寄せ書きURL",
                        controller: urlController,
                      ),
                      TextForm(
                        label: "誰から受け取りましたか？",
                        controller: userController,
                      ),
                      TextForm(
                        label: "なんのお祝いですか？",
                        controller: categoryController,
                      ),
                      const DateForm(
                        label: "受け取り日",
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}
