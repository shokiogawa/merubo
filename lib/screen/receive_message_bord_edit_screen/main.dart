import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/provider/command/edit_receive_message_bord_provider.dart';
import 'package:merubo/utility/show_progress_dialog.dart';
import 'package:merubo/widgets/button.dart';
import 'package:merubo/widgets/date_form.dart';
import 'package:merubo/widgets/image_form.dart';
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
    final kinds = ref.watch(editReceiveMessageBordProvider.select((value) => value.kinds));
    final provider = ref.watch(editReceiveMessageBordProvider.notifier);
    final urlController = provider.urlController;
    final userController = provider.userController;
    final categoryController = provider.categoryController;
    Future(() {
      provider.fetch(year, messageBordId);
    });
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "編集",
        style: TextStyle(color: Colors.white),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
            height: 40,
            child: Button(
                text: "更新",
                buttonColor: Colors.green,
                onPressed: () {
                  showNewProgressDialog(
                      context: context,
                      inProgressText: "更新中",
                      beforeTitle: "更新しますか？",
                      beforeContent: "",
                      beforeCancelText: "キャンセル",
                      beforeDoText: "更新",
                      beforeDoOnPress: () async {
                        await ref
                            .read(editReceiveMessageBordProvider.notifier)
                            .edit();
                      },
                      onSucceedMethod: (context) {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      onFailedMethod: (context) {
                        Navigator.of(context).pop();
                      });
                })),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Form(
                key: formKey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      kinds == MessageBordKinds.online
                          ? TextForm(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "必須項目です。";
                                }
                                return null;
                              },
                              label: "寄せ書きURL",
                              controller: urlController,
                            )
                          : Container(),
                      const SizedBox(height: 20),
                      TextForm(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "必須項目です。";
                          }
                          return null;
                        },
                        label: "誰から受け取りましたか？",
                        controller: userController,
                      ),
                      const SizedBox(height: 20),
                      TextForm(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "必須項目です";
                          }
                          return null;
                        },
                        label: "なんのお祝いですか？",
                        controller: categoryController,
                      ),
                      const SizedBox(height: 20),
                      const DateForm(
                        label: "受け取り日",
                      ),
                      kinds == MessageBordKinds.paper
                          ? ImageForm(
                              label: "写真",
                              coverText: "思い出写真",
                              onChange: (value) {},
                            )
                          : Container()
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
