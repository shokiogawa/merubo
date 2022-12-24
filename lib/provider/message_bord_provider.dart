import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/model/repository/message_bord_repository.dart';
import 'package:merubo/provider/auth_provider.dart';
import 'package:merubo/provider/current_user_provider.dart';

// データが追加されるたびに、このプロバイダーをリフレッシュする。
final ownMessageBordListProvider = FutureProvider.family<List<MessageBord>, Role>((ref, userRole) async {
  final userId = ref.watch(currentUserProvider).id;
  final messageBordList = await ref
      .watch(messageBordRepositoryProvider)
      .fetchOwnMessageBordList(userId, userRole);
  return messageBordList;
});

// 上にスクロールすると更新されるようにする。
final messageBordDetailProvider = FutureProvider.family((ref, messageBordId) async {
  final messageBordDetail = await ref
      .watch(messageBordRepositoryProvider)
      .fetchMessageBordDetail(messageBordId.toString());
  return messageBordDetail;
});
