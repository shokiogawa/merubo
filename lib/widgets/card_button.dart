import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardButton extends ConsumerWidget {
  final String text;
  final void Function()? onTap;
  const CardButton({Key? key, required this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 80,
        child: Card(
          elevation: 3,
            shape:
                const RoundedRectangleBorder(side: BorderSide(color: Colors.black12)),
            child: Center(
              child: Text(
                text,
              ),
            )),
      ),
    );
  }
}
