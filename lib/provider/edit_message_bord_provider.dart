import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/model/entity/message_bord_with_message.dart';
import 'package:merubo/model/repository/message_bord_repository.dart';

class EditMessageBordProvider extends StateNotifier<MessageBordWithMessage> {
  final Ref ref;

  EditMessageBordProvider(this.ref)
      : super(const MessageBordWithMessage(
            messageBord: MessageBord(id: ""), messages: Message(id: "")));

  Future<void> fetchMessageBord(String messageBordId) async {
    final messageBord = await ref
        .watch(messageBordRepositoryProvider)
        .fetchMessageBordById(messageBordId);
    state = state.copyWith(messageBord: messageBord);
  }

  Future<void> fetchMessage(String messageBordId) async {
    final message = await ref
        .watch(messageBordRepositoryProvider)
        .fetchMessageByMessageBordId(messageBordId);
    state = state.copyWith(messages: message);
  }

  Future<void> updateMessageBord() async {
    await ref
        .watch(messageBordRepositoryProvider)
        .updateMessageBord(state.messageBord);
  }

  Future<void> updateMessage(String messageBordId) async {
    await ref
        .watch(messageBordRepositoryProvider)
        .updateMessage(messageBordId, state.messages);
  }
}
