import 'package:flutter/material.dart';
import 'package:merubo/model/entity/message_bord_with_messages.dart';
import 'package:merubo/screen/top_screen/widget/time_line_tile.dart';

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