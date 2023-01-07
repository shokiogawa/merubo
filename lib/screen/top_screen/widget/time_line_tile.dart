import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/model/entity/message_bord_with_messages.dart';
import 'package:merubo/provider/query/hp_info_provider.dart';
import 'package:merubo/screen/top_screen/widget/thumbnail_circle.dart';
import 'package:timelines/timelines.dart';
import 'package:url_launcher/url_launcher.dart';

class TimeLineTile extends StatelessWidget {
  final MessageBordWithMessages data;

  const TimeLineTile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final receivedAt = data.messageBord.receivedAt;
    final displayFormat = DateFormat('MM月dd日');
    final displayReceivedAt = displayFormat.format(receivedAt!);
    final displayCard = data.messageBord.kinds == MessageBordKinds.merubo
        ? MeruboMessageBordCard(data: data)
        : data.messageBord.kinds == MessageBordKinds.online
            ? OnlineMessageBordCard(messageBord: data.messageBord)
            : PaperMessageBordCard(messageBord: data.messageBord);
    return Row(children: [
      Text(displayReceivedAt, style: const TextStyle(fontSize: 10)),
      Expanded(
        flex: 1,
        child: SizedBox(
          height: 150,
          child: TimelineNode.simple(),
        ),
      ),
      // 寄せ書きカード
      Flexible(flex: 10, child: displayCard)
    ]);
  }
}

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
    );
  }
}

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
                  const SizedBox(height: 15),
                  const Text("Mesecaよりメッセージ作成されました。")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnlineMessageBordCard extends ConsumerWidget {
  final MessageBord messageBord;

  const OnlineMessageBordCard({Key? key, required this.messageBord})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(hpInfoProvider(messageBord.onlineUrl!));
    final sendUserName = messageBord.ownerUserName;
    final category = messageBord.category;
    return asyncValue.when(data: (data) {
      final hpTitle = data['title'];
      final hpImage = data['image'];
      return GestureDetector(
        onTap: () async {
          final url = messageBord.onlineUrl;
          if (url != null) {
            if (!await launchUrl(Uri.parse(url))) {
              throw 'Could not launch $url';
            }
          }
        },
        child: Card(
          child: Padding(
            padding:
                const EdgeInsets.only(right: 10, left: 0, top: 10, bottom: 10),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: Image.network(hpImage!).image,
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
                      const SizedBox(height: 15),
                      Text('$hpTitle')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }, error: (err, _) {
      return const Center(child: Text("取得に失敗しました。"));
    }, loading: () {
      return const Center(child: Text("データ取得中。。。"));
    });
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
