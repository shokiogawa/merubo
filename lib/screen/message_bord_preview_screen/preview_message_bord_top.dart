import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/screen/message_bord_preview_screen/template/type1.dart';
import 'package:merubo/screen/message_bord_preview_screen/template/type2.dart';

class PreviewMessageBordTop extends ConsumerWidget {
  const PreviewMessageBordTop({Key? key, required this.messageBord})
      : super(key: key);
  final MessageBord messageBord;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: screenSize.height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(getImageByType(messageBord.type)),
            fit: BoxFit.cover),
      ),
      child: getTopMessageByType(messageBord)
    );
  }
}

// テンプレートごとのメッセージ
Widget getTopMessageByType(MessageBord messageBord){
  switch(messageBord.type){
    case MessageBordType.type1:
      return Type1Template(messageBord: messageBord);
    case MessageBordType.type2:
      return Type2Template(messageBord: messageBord);
    default:
      return Type1Template(messageBord: messageBord);
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
