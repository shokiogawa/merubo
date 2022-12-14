import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:merubo/screen/message_bord_create_screen/widget/bottom_button.dart';
import 'package:merubo/screen/message_bord_create_screen/widget/progress_app_bar.dart';
import 'package:merubo/widgets/image_form.dart';
import 'package:merubo/widgets/text_form.dart';
import '../../provider/command/create_message_bord_provider.dart';

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
                          "???????????????????????????????????????",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //???????????????
                      TextForm(
                        controller: yourNameController,
                        label: "?????????????????????",
                        prefixIcon: const Icon(Icons.person),
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return "?????????????????????????????????";
                          }
                          if (value.length > 20) {
                            return "20????????????????????????????????????";
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
                            // ???????????????
                            const Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Text("??????????????????(??????)"),
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
                      // ???????????????
                      TextForm(
                        controller: messageContentController,
                        label: "???????????????",
                        maxLine: 10,
                        contentPadding: const EdgeInsets.all(20),
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return "????????????????????????????????????";
                          }
                          if (value.length > 500) {
                            return "500????????????????????????????????????";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40),
                      ImageForm(
                        label: "??????(??????)",
                        coverText: "???????????????????????????",
                        onChange: (value){
                          createMessageProvider.setMessageImage(value);
                        },
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
