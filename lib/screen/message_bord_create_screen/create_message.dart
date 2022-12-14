import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:merubo/screen/message_bord_create_screen/widget/bottom_button.dart';
import 'package:merubo/screen/message_bord_create_screen/widget/progress_app_bar.dart';
import '../../provider/create_message_bord_provider.dart';

class CreateMessageScreen extends ConsumerWidget {
  CreateMessageScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createMessageProvider = ref.watch(createMessageBordProvider.notifier);
    final messageValue =
        ref.watch(createMessageBordProvider.select((value) => value.messages));
    final yourNameController = createMessageProvider.yourNameController;
    final messageContentController =
        createMessageProvider.messageContentController;
    return Scaffold(
      appBar: const ProgressAppBar(),
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
                            textInputAction: TextInputAction.next,
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
                                    createMessageProvider
                                        .setMessageThumbnail(imageSource.path);
                                  }
                                },
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      messageValue.thumbnail != null
                                          ? Image.file(
                                                  File(messageValue.thumbnail!))
                                              .image
                                          : null,
                                ))
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
                            textInputAction: TextInputAction.done,
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
                      const SizedBox(height: 20),
                      //音声メッセージ
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text("音声メッセージ(任意)"),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final imageSource = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              if (imageSource != null) {}
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              color: Colors.orangeAccent,
                              child: const Text("画像が入る場所"),
                            ),
                          )
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
                                createMessageProvider
                                    .setMessageImage(imageSource.path);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  image: messageValue.image != null ? DecorationImage(
                                      image:
                                          Image.file(File(messageValue.image!))
                                              .image,
                                      fit: BoxFit.contain) : null),
                              height: 250,
                              child: messageValue.image == null
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
          BottomButton(onPressed: () {
            if (formKey.currentState!.validate()) {
              ref.read(currentIndexProviderForCreate.notifier).state = 3;
              Navigator.of(context)
                  .pushNamed('/message_bord_create_bottom_message_screen');
            }
          })
        ],
      ),
    );
  }
}
