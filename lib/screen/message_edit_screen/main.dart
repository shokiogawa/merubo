import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:merubo/provider/command/create_message_bord_provider.dart';
import 'package:merubo/provider/command/edit_message_bord_provider.dart';
import 'package:merubo/utility/show_progress_dialog.dart';
import 'package:merubo/widgets/button.dart';

class MessageEditScreen extends ConsumerWidget {
  const MessageEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageBordId = ModalRoute.of(context)!.settings.arguments as String;
    ref.watch(editMessageBordProvider.notifier).fetchMessage(messageBordId);
    final notifier = ref.watch(editMessageBordProvider.notifier);
    final thumbnailPath = ref
        .watch(editMessageBordProvider.select((value) => value.thumbnailPath));
    final imagePath =
        ref.watch(editMessageBordProvider.select((value) => value.imagePath));
    final message =
        ref.watch(editMessageBordProvider.select((value) => value.messages));
    final yourNameController = notifier.yourNameController;
    final messageContentController = notifier.messageContentController;

    final displayThumbnail = thumbnailPath != null
        ? Image.file(File(thumbnailPath)).image
        : message.thumbnail != null
            ? Image.network(message.thumbnail!).image
            : null;
    final displayImage = imagePath != null
        ? DecorationImage(
            image: Image.file(File(imagePath)).image, fit: BoxFit.contain)
        : message.image != null
            ? DecorationImage(
                image: Image.network(message.image!).image, fit: BoxFit.contain)
            : null;
    final isDisplay = imagePath == null && message.image == null;
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40, right: 20, left: 20),
        child: Button(
            height: 50,
            text: "更新",
            buttonColor: Colors.green,
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                showNewProgressDialog(
                    context: context,
                    inProgressText: '編集中',
                    beforeTitle: '編集しますか？',
                    beforeContent: '該当のデータを編集します。',
                    beforeCancelText: "キャンセル",
                    beforeDoText: "編集",
                  beforeCancelOnPress: (){
                      Navigator.of(context).pop();
                  },
                  beforeDoOnPress: ()async{
                      await ref.read(editMessageBordProvider.notifier).updateMessage(messageBordId);
                  },
                  onSucceedMethod: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                  },
                  onFailedMethod: (){
                      // TODO: 失敗した時のメソッド
                  }
                );
                // showProgressDialog(
                //     context: context,
                //     onPressed: () async {
                //       ref.read(progressIndicatorProvider.notifier).state = true;
                //       await ref
                //           .read(editMessageBordProvider.notifier)
                //           .updateMessage(messageBordId)
                //           .then((value) {
                //         ref.read(progressIndicatorProvider.notifier).state =
                //         false;
                //         Navigator.of(context).pop();
                //         Navigator.of(context).pop();
                //       });
                //     },
                //     inProgressText: '更新中',
                //     confirmText: '更新しますか？',
                //     buttonText: '更新');
              }
            }),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "あなたからのメッセージ作成",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //自分の名前
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 自分の名前
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text("あなたのお名前"),
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "お名前は必須項目です。";
                              }
                              if (value.length > 20) {
                                return "20文字以内でご入力ください";
                              }
                            },
                            controller: yourNameController,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                contentPadding: EdgeInsets.all(0),
                                hintStyle: TextStyle(fontSize: 12),
                                border: OutlineInputBorder()),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 自分の名前
                            const Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Text("あなたの写真(任意)"),
                            ),
                            GestureDetector(
                                onTap: () async {
                                  final imageSource = await ImagePicker()
                                      .pickImage(source: ImageSource.gallery);
                                  if (imageSource != null) {
                                    notifier
                                        .setMessageThumbnail(imageSource.path);
                                  }
                                },
                                child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: displayThumbnail))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text("メッセージ"),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "メッセージは必須項目です";
                              }
                              if (value.length > 500) {
                                return "500文字以内でご入力ください";
                              }
                            },
                            controller: messageContentController,
                            maxLines: 10,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(20),
                                hintStyle: TextStyle(fontSize: 12),
                                border: OutlineInputBorder()),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text("写真(任意)"),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final imageSource = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              if (imageSource != null) {
                                notifier.setMessageImage(imageSource.path);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  image: displayImage),
                              height: 250,
                              child: isDisplay
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(Icons.camera_alt_rounded),
                                        Text("思い出の画像を選択"),
                                      ],
                                    )
                                  : null,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
