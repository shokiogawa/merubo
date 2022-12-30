import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

// 初期は空
final selectedImageProvider = StateProvider.autoDispose<String>((ref) => "");

class ImageForm extends ConsumerWidget {
  final String? coverText;
  final ValueChanged<String>? onChange;

  const ImageForm(
      {Key? key, this.coverText, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePath = ref.watch(selectedImageProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text("写真(任意)"),
        ),
        GestureDetector(
          onTap: () async {
            final imageSource =
                await ImagePicker().pickImage(source: ImageSource.gallery);
            if (imageSource != null) {
              ref
                  .read(selectedImageProvider.notifier)
                  .update((state) => imageSource.path);
              if (onChange != null) {
                onChange!(ref.read(selectedImageProvider));
              }
            }
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                image: imagePath.isNotEmpty
                    ? DecorationImage(
                        image: Image.file(File(imagePath)).image,
                        fit: BoxFit.contain)
                    : null),
            height: 250,
            child: imagePath.isEmpty
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.camera_alt_rounded),
                      Text(coverText ?? ""),
                    ],
                  )
                : null,
          ),
        )
      ],
    );
  }
}
