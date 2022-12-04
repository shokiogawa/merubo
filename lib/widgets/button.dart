import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Function onPressed;

  const Button(
      {Key? key,
      required this.text,
      required this.buttonColor,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                backgroundColor: buttonColor),
            onPressed: ()=> onPressed(),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}