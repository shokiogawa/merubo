import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/repository/message_bord_repository.dart';
import 'package:merubo/provider/auth_provider.dart';
import 'package:merubo/provider/current_user_provider.dart';

// データが追加されるたびに、このプロバイダーをリフレッシュする。
final ownMessageBordListProvider = FutureProvider((ref) async {
  final userId = ref.watch(currentUserProvider).id;
  final messageBordList = await ref
      .watch(messageBordRepositoryProvider)
      .fetchOwnMessageBordList(userId);
  return messageBordList;
});
