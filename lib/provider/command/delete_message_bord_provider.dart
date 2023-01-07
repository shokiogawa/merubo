import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/repository/message_bord_repository.dart';
import 'package:merubo/provider/query/message_bord_provider.dart';

final deleteMessageBordProvider = Provider((ref) => DeleteMessageBord(ref));

class DeleteMessageBord {
  final Ref ref;

  const DeleteMessageBord(this.ref);

  Future<void> delete(String messageBordId) async {
    await ref.watch(messageBordRepositoryProvider).delete(messageBordId);
    ref.invalidate(receiveMessageBordListProvider);
  }
}
