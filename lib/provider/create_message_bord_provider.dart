import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/model/entity/message_bord_with_messages.dart';
import 'package:merubo/model/repository/message_bord_repository.dart';
import 'package:uuid/uuid.dart';

// メッセージボード作成のためのprovider
final currentIndexProviderForCreate = StateProvider<int>((ref) {
  return 0;
});

final createMessageBord =
    StateNotifierProvider<CreateMessageBord, MessageBordWithMessages>(
        (ref) => CreateMessageBord(ref));

class CreateMessageBord extends StateNotifier<MessageBordWithMessages> {
  CreateMessageBord(this.ref)
      : super(const MessageBordWithMessages(messageBord: MessageBord()));
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
    final message = Message(
        userName: userName,
        thumbnail: thumbnail,
        content: content,
        voiceMessage: voidMessage);
    final List<Message> messages = [];
    messages.add(message);
    state = state.copyWith(messages: messages);
  }

  void setLastMessage(String lastMessage) {
    final messageBord = state.messageBord.copyWith(lastMessage: lastMessage);
    state = state.copyWith(messageBord: messageBord);
  }

  // 保存メソッド
  Future<void> createMessageBordWithMessage() async {
    await ref.watch(messageBordRepositoryProvider).createMessageBord(state);
  }
}
