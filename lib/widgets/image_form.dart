import 'package:flutter/material.dart';

class ImageForm extends StatelessWidget {
  final void Function()? onTap;
  final DecorationImage? image;
  final Widget? coverChild;

  const ImageForm({Key? key, this.onTap, this.image, this.coverChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text("写真(任意)"),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black), image: image),
            height: 250,
            child: coverChild,
          ),
        )
      ],
    );
  }
}
