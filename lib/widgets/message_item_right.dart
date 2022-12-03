import 'package:flutter/material.dart';
import 'package:merubo/model/entity/message.dart';

class MessageItemRight extends StatelessWidget {
  final Message message;

  const MessageItemRight({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(flex: 2, child: Container()),
          Flexible(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(message.userName ?? "unkown"),
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    gradient: LinearGradient(
                        begin: FractionalOffset.topLeft,
                        end: FractionalOffset.bottomRight,
                        colors: [
                          Color.fromARGB(255, 108, 132, 235),
                          Color.fromARGB(250, 132, 199, 250),
                        ],
                        stops: [
                          0.0,
                          1.0
                        ]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      message.content ?? "unkwon",
                      style: const TextStyle(
                          color: Colors.white, overflow: TextOverflow.clip),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          const Flexible(
            flex: 1,
            child: CircleAvatar(
              radius: 15,
            ),
          ),
        ],
      ),
    );
    ;
  }
}
