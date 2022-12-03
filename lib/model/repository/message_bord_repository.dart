import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message_bord.dart';

class MessageBordRepository {
  MessageBordRepository(this.ref);

  final Ref ref;

  //自分が管理また、メッセージしたメッセージボード一覧
  Future<List<MessageBord>> fetchOwnMessageBordList() async {
    final List<MessageBord> messageBordList = [];
    return messageBordList;
  }

  //自分が受け取ったメッセージボード一覧
  Future<List<MessageBord>> fetchReceiveMessageBordList() async {
    final List<MessageBord> messageBordList = [];
    return messageBordList;
  }

  //メッセージボード詳細
  Future<void> fetchMessageBordDetail() async {}

  //メッセージボード作成
  Future<void> createMessageBord() async {}

  //メッセージボード更新
  Future<void> updateMessageBord() async {}

  //メッセージボード削除
  Future<void> deleteMessageBord() async {}
}
