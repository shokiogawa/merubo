import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:merubo/model/entity/message.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/model/entity/message_bord_with_messages.dart';
import 'package:merubo/model/repository/message_bord_repository.dart';
import 'package:merubo/provider/auth_provider.dart';
import 'package:merubo/provider/current_user_provider.dart';

// データが追加されるたびに、このプロバイダーをリフレッシュする。
final ownMessageBordListProvider =
    FutureProvider.family<List<MessageBord>, Role>((ref, userRole) async {
  final userId = ref.watch(currentUserProvider).id;
  final messageBordList = await ref
      .watch(messageBordRepositoryProvider)
      .fetchOwnMessageBordList(userId, userRole);
  return messageBordList;
});

// 受け取ったメッセージボード一覧を取得
final receiveMessageBordListProvider = FutureProvider((ref) async {
  final data = await ref
      .watch(messageBordRepositoryProvider)
      .fetchReceiveMessageBordList();
  final Map<String, List<MessageBordWithMessages>> mapValue = {};
  for (var value in data) {
    final yearFormat = DateFormat('yyyy年');
    final key = yearFormat.format(value.messageBord.receivedAt!);

    if(mapValue.containsKey(key)){
      mapValue[yearFormat.format(value.messageBord.receivedAt!)]!.add(value);
    }else{
      final list = [value];
      mapValue[yearFormat.format(value.messageBord.receivedAt!)] = list;
    }
  }
  return mapValue;
});

// 上にスクロールすると更新されるようにする。
final messageBordDetailProvider =
    FutureProvider.family.autoDispose((ref, messageBordId) async {
  final messageBordDetail = await ref
      .watch(messageBordRepositoryProvider)
      .fetchMessageBordDetail(messageBordId.toString());
  return messageBordDetail;
});

// 編集用にメッセージボード取得
final messageBordProvider = FutureProvider.autoDispose
    .family<MessageBord, String>((ref, messageBordId) async {
  final messageBord = await ref
      .watch(messageBordRepositoryProvider)
      .fetchMessageBordById(messageBordId);
  return messageBord;
});

// 編集用にメッセージ取得
final myMessageProvider = FutureProvider.autoDispose
    .family<Message, String>((ref, messageBordId) async {
  final message = await ref
      .watch(messageBordRepositoryProvider)
      .fetchMessageByMessageBordId(messageBordId);
  return message;
});

// 選択されている寄せ書きのIDを取得
final selectedMessageBordId =
    Provider.family.autoDispose<MessageBord, String>((ref, messageBordId) {
  final data = ref.watch(ownMessageBordListProvider(Role.owner));
  if (data.value != null) {
    return data.value!
        .where((element) => element.id == messageBordId)
        .toList()[0];
  }
  throw UnimplementedError('selectedMessageBordIdプロバイダーが機能していません。');
});
