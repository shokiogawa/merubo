import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return PaperMessageBordDetail(messageBord: messageBord);
        }));
      },
      child: Card(
        child: Padding(
          padding:
              const EdgeInsets.only(right: 10, left: 0, top: 10, bottom: 10),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Hero(
                    tag: messageBord.id,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          Image.file(File(messageBord.lastPicture!)).image,
                    ),
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
                              "色紙で受け取り",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 12),
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
      ),
    );
  }
}

class PaperMessageBordDetail extends StatelessWidget {
  final MessageBord messageBord;

  const PaperMessageBordDetail({Key? key, required this.messageBord})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "受け取った寄せ書き",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
                Hero(
                    tag: messageBord.id,
                    child: InteractiveViewer(
                        child: Image.file(File(messageBord.lastPicture!)))),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Text(
                    getDescription(messageBord),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

String getDescription(MessageBord messageBord) {
  final receivedAt = messageBord.receivedAt;
  final displayFormat = DateFormat('yyyy年MM月dd日');
  final displayReceivedAt = displayFormat.format(receivedAt!);
  final description =
      '$displayReceivedAt\n${messageBord.ownerUserName}さんより${messageBord.category}のお祝いが届きました。';
  return description;
}
