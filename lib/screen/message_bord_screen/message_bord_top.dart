import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageBordTop extends ConsumerWidget {
  const MessageBordTop({Key? key}) : super(key: key);

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
            "小川 翔生",
            style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
              "Happy Birthday",
              style: TextStyle(color: Colors.amberAccent, fontSize: 45),
                ),
              ),
              Text(
            "誕生日おめでとう",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      )),
    );
  }
}
