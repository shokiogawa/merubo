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
            messageBord: MessageBord(id: const Uuid().v4(), receiverUserName: "", title: ""),
            messages: Message(id: const Uuid().v4())));
  final Ref ref;

  final receiverUserNameController = TextEditingController();
  final titleMessageController = TextEditingController();
  final yourNameController = TextEditingController();
  final messageContentController = TextEditingController();
  final lastMessageController = TextEditingController();

  void setType(MessageBordType type) {
    final messageBord = state.messageBord.copyWith(type: type);
    state = state.copyWith(messageBord: messageBord);
  }

  void setThumbnail(String thumbnailPath){
    final newMessage = state.messages.copyWith(thumbnail: thumbnailPath);
    state = state.copyWith(messages: newMessage);
  }

  void setVoiceMessage(String voiceMessage){
    final newMessage = state.messages.copyWith(voiceMessage: voiceMessage);
    state = state.copyWith(messages: newMessage);
  }

  // 保存メソッド
  Future<void> createMessageBordWithMessage() async {
    final newMessage = state.messages.copyWith(
        userName: yourNameController.text,
        content: messageContentController.text);
    final newMessageBord = state.messageBord.copyWith(
        title: titleMessageController.text,
      receiverUserName: receiverUserNameController.text,
      lastMessage: lastMessageController.text
    );
    state = state.copyWith(messages: newMessage, messageBord: newMessageBord);
    await ref.watch(messageBordRepositoryProvider).createMessageBord(state);
  }

  void cleanUp(){
    final newMessage = state.messages.copyWith(thumbnail: "", voiceMessage: "");
    final newMessageBord = state.messageBord.copyWith();
    receiverUserNameController.clear();
    titleMessageController.clear();
    yourNameController.clear();
    messageContentController.clear();
    lastMessageController.clear();
    state = state.copyWith(messages: newMessage, messageBord: newMessageBord);
  }
}
