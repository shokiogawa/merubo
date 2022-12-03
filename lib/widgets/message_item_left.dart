import 'package:flutter/material.dart';
import 'package:merubo/model/entity/message.dart';

class MessageItemLeft extends StatelessWidget {
  final Message message;

  const MessageItemLeft({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Flexible(
            flex: 1,
            child: CircleAvatar(
              radius: 15,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Flexible(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(message.userName ?? "unnown"),
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    gradient: LinearGradient(
                        begin: FractionalOffset.topRight,
                        end: FractionalOffset.bottomLeft,
                        colors: [
                          Color.fromARGB(255, 108, 140, 235),
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
                      message.content ?? "unnown",
                      style: const TextStyle(
                          color: Colors.white, overflow: TextOverflow.clip),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(flex: 2, child: Container()),
        ],
      ),
    );
  }
}
