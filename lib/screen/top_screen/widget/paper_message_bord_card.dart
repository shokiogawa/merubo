import 'dart:io';

import 'package:flutter/material.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/screen/top_screen/widget/message_bord_menu_button.dart';

class PaperMessageBordCard extends StatelessWidget {
  final MessageBord messageBord;

  const PaperMessageBordCard({Key? key, required this.messageBord})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sendUserName = messageBord.ownerUserName;
    final category = messageBord.category;
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 0, top: 10, bottom: 10),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      Image.file(File(messageBord.lastPicture!)).image,
                )),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$sendUserNameさんより、$categoryのお祝いが届きました',
                    overflow: TextOverflow.clip,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Expanded(
                          flex: 5,
                          child: Text(
                            "紙の寄せ書き",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )),
                      Expanded(
                          flex: 1,
                          child: MessageBordMenuButton(
                            messageBord: messageBord,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
