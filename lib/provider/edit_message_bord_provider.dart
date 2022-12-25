import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/model/entity/message_bord_with_message.dart';
import 'package:merubo/model/repository/message_bord_repository.dart';

final editMessageBordProvider = StateNotifierProvider.autoDispose<EditMessageBordProvider, MessageBordWithMessage>((ref){
  return EditMessageBordProvider(ref);
});

class EditMessageBordProvider extends StateNotifier<MessageBordWithMessage> {
  final Ref ref;
  final receiverUserNameController = TextEditingController();
  final titleController = TextEditingController();
  EditMessageBordProvider(this.ref)
      : super(const MessageBordWithMessage(
            messageBord: MessageBord(id: ""), messages: Message(id: "")));

  @override
  void dispose(){
    receiverUserNameController.dispose();
    titleController.dispose();
    super.dispose();
  }

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
