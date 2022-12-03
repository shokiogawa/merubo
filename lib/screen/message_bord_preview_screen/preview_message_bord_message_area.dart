import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message_bord.dart';
import '../../model/entity/message.dart';
import '../../widgets/message_item_left.dart';
import '../../widgets/message_item_right.dart';

class PreviewMessageBordMessageArea extends ConsumerWidget {
  final MessageBordType type;

  const PreviewMessageBordMessageArea({Key? key, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Message> messages = [
      const Message(
          id: "id",
          userName: "浜辺美波",
          content:
              "先生お元気ですか？私は元気です。あれから10年経ったなんて信じられません。。また、どこかでお会いした際はご指導よろしくお願いいたします。"),
      const Message(
          id: "id",
          userName: "小川翔生",
          content: "先生お久しぶりです！！あれから10年ですが、、何年経っても、私たちの先生でいてください。"),
      const Message(
          id: "id",
          userName: "高山美波",
          content: "あの日は大変お世話になりました。私たちは、もう25歳です。先生とまた会える日をお待ちしておいります。"),
      const Message(id: "id", userName: "乃木野マキ", content: "先生、またどこかで会おう！！"),
    ];
    return Container(
      padding: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 5),
          color: Colors.white24),
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  color: Colors.white),
              child: const Text(
                "Messaging Bord",
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.double),
              )),
          ListView.builder(
              padding: const EdgeInsets.only(top: 0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                if (index % 2 == 1) {
                  return MessageItemLeft(
                    message: messages[index],
                  );
                } else {
                  return MessageItemRight(
                    message: messages[index],
                  );
                }
              }),
        ],
      ),
    );
  }
}
