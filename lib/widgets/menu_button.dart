import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton(
      {Key? key,
      required this.onTap,
      required this.imagePath,
      required this.text})
      : super(key: key);
  final void Function() onTap;
  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        SizedBox(
          height: 150,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.cover)),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              height: 150,
              child: Center(
                  child:
                      Text(text, style: const TextStyle(color: Colors.white)))),
        ),
      ],
    );
  }
}
