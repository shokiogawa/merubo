// テンプレートのジャンル
import 'package:flutter/cupertino.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/model/entity/template.dart';

final Map<String, List<Template>> mapTemplate = {
  "結婚祝い": templateList1,
  "お誕生日祝い": templateList2,
  "おめでとう": templateList3,
  "ありがとう": templateList4,
  "クリスマス": templateList5,
};

const template1 = Template(MessageBordType.type1, "assets/images/chrisumasu.jpg");
const template2 =
    Template(MessageBordType.type2, "assets/images/oiwai.jpg");

// テンプレート一覧
const List<Template> templateList1 = [template1, template2];
const List<Template> templateList2 = [template1, template2];
const List<Template> templateList3 = [template1, template2];
const List<Template> templateList4 = [template1, template2];
const List<Template> templateList5 = [template1, template2];

class Utility{
  static GlobalKey<NavigatorState> createMessageBordNav = GlobalKey();
  static GlobalKey<NavigatorState> mainNav = GlobalKey();
}
