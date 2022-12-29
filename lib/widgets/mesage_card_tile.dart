import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message_bord.dart';

class MessageCardTile extends ConsumerWidget {
  final MessageBord messageBord;
  final Function() onTap;

  const MessageCardTile({Key? key, required this.messageBord, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
          elevation: 7,
          child: Row(
            children: [
              const Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.edit_note_outlined,
                    color: Colors.orange,
                    size: 50,
                  )),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${messageBord.receiverUserName}への寄せ書き"),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(messageBord.title ?? ""),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        padding: const EdgeInsets.all(2),
                          child: const Text(
                            "タップして寄せ書きを確認する",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey
                            ),)),
                    ],
                  ),
                ),
              ),
            ],
          )
          ),
    );
  }
}
