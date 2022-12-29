import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/provider/message_bord_provider.dart';
import 'package:merubo/screen/top_screen/widget/thumbnail_circle.dart';
import 'package:timelines/timelines.dart';

import '../../../model/entity/message_bord_with_messages.dart';

class ReceiveMessageBordList extends ConsumerWidget {
  const ReceiveMessageBordList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("MessageBordListPage");
    final asyncValue = ref.watch(receiveMessageBordListProvider);
    return asyncValue.when(
        data: (data) => Scaffold(
              appBar: AppBar(
                  toolbarHeight: 140,
                  flexibleSpace: Stack(
                    children: [
                      const Center(
                          child: Text(
                        "Merubo",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                          ),
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 58),
                              CircleAvatar(
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.add))),
                              const SizedBox(width: 50),
                              const Text(
                                "タイムライン",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final displayYear = data.keys.elementAt(index);
                        return MessageBordByYear(displayYear: displayYear, data: data[displayYear]!);
                      }),
                ),
              ),
            ),
        error: (err, _) => Text(err.toString()),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
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

class MessageBordByYear extends StatelessWidget {
  final String displayYear;
  final List<MessageBordWithMessages> data;

  const MessageBordByYear({Key? key, required this.displayYear, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timeLineTile = data.map((value) => TimeLineTile(data: value)).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Divider(
                thickness: 1,
                height: 30,
                color: Colors.grey,
              ),
            ),
            Text(displayYear),
            const Expanded(
              child: Divider(
                thickness: 1,
                height: 30,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        ...timeLineTile
      ],
    );
  }
}


class TimeLineTile extends StatelessWidget {
  final MessageBordWithMessages data;
  const TimeLineTile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sendUserName = data.messageBord.ownerUserName;
    final messageCount = data.messages.length;
    final receivedAt = data.messageBord.receivedAt;
    final displayFormat = DateFormat('MM月dd日');
    final displayReceivedAt = displayFormat.format(receivedAt!);
    final category = data.messageBord.category;
    final List<Widget> messageThumbnails = [
      ...data
          .messages
          .map((message) =>
          ThumbnailCircle(thumbnailPath: message.thumbnail))
          .toList()
          .take(3)
          .toList()
    ];
    if (data.messages.length > 3) {
      messageThumbnails
          .add(const Text("...", style: TextStyle(fontSize: 10)));
    }
    return Row(children: [
      Text(displayReceivedAt, style: const TextStyle(fontSize: 10)),
      Expanded(
        flex: 1,
        child: SizedBox(
          height: 150,
          child: TimelineNode.simple(),
        ),
      ),
      Flexible(
          flex: 10,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 10, left: 0, top: 10, bottom: 10),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: CircleAvatar(
                          radius: 30,
                          backgroundImage: Image.asset(getImageByType(
                              data.messageBord.type))
                              .image)),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$sendUserNameさんより、$categoryのお祝いが届きました',
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15),
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
                  ),
                ],
              ),
            ),
          ))
    ]);
  }
}
