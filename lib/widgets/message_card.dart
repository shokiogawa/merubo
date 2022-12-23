import 'package:flutter/material.dart';
import 'package:merubo/model/entity/message.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({Key? key, required this.message}) : super(key: key);
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 自分の名前、サムネイル
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: message.thumbnail == null ? Image.asset('assets/images/chrisumasu.jpg').image  : Image.network(message.thumbnail!).image,
                    radius: 15,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(message.userName ?? "unknown")
                ],
              ),
              // voiceMessage
              Container(),
              // メッセージ欄
              Padding(
                 padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                 child: Text(message.content ?? "おめでとう！！",
                   style: const TextStyle(
                       overflow: TextOverflow.clip,
                     fontSize: 15,
                     height: 1.6,
                   ),),
               ),
              // 画像エリア
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
