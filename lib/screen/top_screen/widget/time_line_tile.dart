import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/model/entity/message_bord_with_messages.dart';
import 'package:merubo/screen/top_screen/widget/merubo_message_bord_card.dart';
import 'package:merubo/screen/top_screen/widget/online_message_bord_card.dart';
import 'package:timelines/timelines.dart';

import 'paper_message_bord_card.dart';

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
