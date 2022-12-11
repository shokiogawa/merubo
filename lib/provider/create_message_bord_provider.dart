import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/model/entity/message_bord_with_message.dart';
import 'package:merubo/model/repository/message_bord_repository.dart';
import 'package:uuid/uuid.dart';

// メッセージボード作成のためのprovider
final currentIndexProviderForCreate = StateProvider<int>((ref) {
  return 0;
});

final createMessageBord =
    StateNotifierProvider<CreateMessageBord, MessageBordWithMessage>(
        (ref){
          return CreateMessageBord(ref);
        });

class CreateMessageBord extends StateNotifier<MessageBordWithMessage> {
  CreateMessageBord(this.ref)
      : super(MessageBordWithMessage(
            messageBord: MessageBord(id: const Uuid().v4()),
            messages: Message(id: const Uuid().v4())));
  final Ref ref;

  void setType(MessageBordType type) {
    final messageBord = state.messageBord.copyWith(type: type);
    state = state.copyWith(messageBord: messageBord);
    print(state.messageBord.type);
  }

  void setBasicMessage(String receiverUserName, String title) {
    final messageBord = state.messageBord
        .copyWith(receiverUserName: receiverUserName, title: title);
    state = state.copyWith(messageBord: messageBord);
  }

  void setMessage(
      String userName, String thumbnail, String content, String voidMessage) {
    final message = state.messages.copyWith(
        userName: userName,
        thumbnail: thumbnail,
        content: content,
        voiceMessage: voidMessage);
    state = state.copyWith(messages: message);
  }

  void setMessageUserName(String userName){
    final message = state.messages.copyWith(userName: userName);
    state = state.copyWith(messages: message);
    print(state.messages.userName);
  }

  void setMessageContent(String content){
    final message = state.messages.copyWith(content: content);
    state = state.copyWith(messages: message);
    print(state.messages.content);
  }

  void setLastMessage(String lastMessage) {
    final messageBord = state.messageBord.copyWith(lastMessage: lastMessage);
    state = state.copyWith(messageBord: messageBord);
  }

  // 保存メソッド
  Future<void> createMessageBordWithMessage() async {
    await ref.watch(messageBordRepositoryProvider).createMessageBord(state);
  }

  bool checkCanCreateMessage() {
    print(state.messages.userName);
    print(state.messages.content);
    if (state.messages.userName != null ||
        state.messages.content != null) {
      return true;
    }
    return false;
  }
}
