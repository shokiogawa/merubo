import 'package:flutter/material.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/model/entity/message_bord_with_messages.dart';
import 'package:merubo/screen/top_screen/widget/message_bord_menu_button.dart';
import 'package:merubo/screen/top_screen/widget/thumbnail_circle.dart';

class MeruboMessageBordCard extends StatelessWidget {
  final MessageBordWithMessages data;

  const MeruboMessageBordCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sendUserName = data.messageBord.ownerUserName;
    final messageCount = data.messages.length;
    final category = data.messageBord.category;
    final List<Widget> messageThumbnails = [
      ...data.messages
          .map((message) => ThumbnailCircle(thumbnailPath: message.thumbnail))
          .toList()
          .take(3)
          .toList()
    ];
    if (data.messages.length > 3) {
      messageThumbnails.add(const Text("...", style: TextStyle(fontSize: 10)));
    }
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
                        Image.asset(getImageByType(data.messageBord.type))
                            .image)),
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
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        const Text("参加者:"),
                        Row(
                          children: messageThumbnails,
                        )
                      ]),
                      const SizedBox(
                        height: 2,
                      ),
                      Text('参加人数: $messageCount')
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                          flex: 5,
                          child: Text(
                            'Meruboで受け取り',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12),
                          )),
                      Expanded(
                          flex: 1, child: MessageBordMenuButton(messageBord: data.messageBord))
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

// テンプレートごとの写真
String getImageByType(MessageBordType? type) {
  switch (type) {
    case MessageBordType.type1:
      return 'assets/images/chrisumasu.jpg';
    case MessageBordType.type2:
      return 'assets/images/oiwai.jpg';
    default:
      return "";
  }
}
