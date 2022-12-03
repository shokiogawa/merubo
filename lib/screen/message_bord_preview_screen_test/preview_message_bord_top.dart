import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message_bord.dart';

class PreviewMessageBordTop extends ConsumerWidget {
  const PreviewMessageBordTop({Key? key, required this.type}) : super(key: key);
  final MessageBordType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: screenSize.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/chrisumasu.jpg'),
            fit: BoxFit.cover),
      ), 
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
            "鈴木先生",
            style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
              "Thank you",
              style: TextStyle(color: Colors.amberAccent, fontSize: 45),
                ),
              ),
              Text(
            "これまでお世話になりました。",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      )),
    );
  }
}
