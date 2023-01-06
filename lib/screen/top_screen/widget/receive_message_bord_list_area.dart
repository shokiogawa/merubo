import 'package:flutter/material.dart';
import 'package:merubo/model/entity/message_bord_with_messages.dart';
import 'package:merubo/screen/top_screen/widget/message_bord_by_year.dart';

class ReceiveMessageBordListArea extends StatelessWidget {
  final Map<String, List<MessageBordWithMessages>> data;

  const ReceiveMessageBordListArea({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              final displayYear = data.keys.elementAt(index);
              return MessageBordByYear(
                  displayYear: displayYear, data: data[displayYear]!);
            }),
      ),
    );
  }
}