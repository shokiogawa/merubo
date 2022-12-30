import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:merubo/screen/message_bord_create_screen/widget/bottom_button.dart';
import 'package:merubo/screen/message_bord_create_screen/widget/progress_app_bar.dart';
import 'package:merubo/widgets/image_form.dart';
import 'package:merubo/widgets/text_form.dart';
import '../../provider/create_message_bord_provider.dart';

class CreateMessageScreen extends ConsumerWidget {
  CreateMessageScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createMessageProvider = ref.watch(createMessageBordProvider.notifier);
    final thumbnailPath = ref.watch(
        createMessageBordProvider.select((value) => value.thumbnailPath));
    final imagePath =
        ref.watch(createMessageBordProvider.select((value) => value.imagePath));
    final yourNameController = createMessageProvider.yourNameController;
    final messageContentController =
        createMessageProvider.messageContentController;
    return Scaffold(
      appBar: const ProgressAppBar(currentIndex: 2),
      bottomNavigationBar: BottomButton(onPressed: () {
        if (formKey.currentState!.validate()) {
          Navigator.of(context)
              .pushNamed('/message_bord_create_bottom_message_screen');
        }
      }),
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
                      TextForm(
                        controller: yourNameController,
                        label: "あなたのお名前",
                        prefixIcon: const Icon(Icons.person),
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return "お名前は必須項目です。";
                          }
                          if (value.length > 20) {
                            return "20文字以内でご入力ください";
                          }
                          return null;
                        },
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
                                  backgroundImage: thumbnailPath != null
                                      ? Image.file(File(thumbnailPath)).image
                                      : null,
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // メッセージ
                      TextForm(
                        controller: messageContentController,
                        label: "メッセージ",
                        maxLine: 10,
                        contentPadding: const EdgeInsets.all(20),
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return "メッセージは必須項目です";
                          }
                          if (value.length > 500) {
                            return "500文字以内でご入力ください";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40),
                      ImageForm(
                        onTap: () async {
                          final imageSource = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (imageSource != null) {
                            createMessageProvider
                                .setMessageImage(imageSource.path);
                          }
                        },
                        image: imagePath != null
                            ? DecorationImage(
                                image: Image.file(File(imagePath)).image,
                                fit: BoxFit.contain)
                            : null,
                        coverChild: imagePath == null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.camera_alt_rounded),
                                  Text("思い出の画像を選択"),
                                ],
                              )
                            : null,
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
