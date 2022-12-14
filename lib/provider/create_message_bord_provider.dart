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

final createMessageBordProvider =
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

  void setMessageImage(String imagePath){
    final newMessage = state.messages.copyWith(image: imagePath);
    state = state.copyWith(messages: newMessage);
  }

  void setMessageThumbnail(String thumbnailPath){
    print(thumbnailPath);
    final newMessage = state.messages.copyWith(thumbnail: thumbnailPath);
    state = state.copyWith(messages: newMessage);
  }

  void setMessageVoiceMessage(String voiceMessage){
    final newMessage = state.messages.copyWith(voiceMessage: voiceMessage);
    state = state.copyWith(messages: newMessage);
  }

  void setMessageBordLastPicture(String lastPicture){
    final messageBord = state.messageBord.copyWith(lastPicture: lastPicture);
    state = state.copyWith(messageBord: messageBord);
  }

  void setMessageBordLastVideo(String lastMovie){
    final messageBord = state.messageBord.copyWith(lastMovie: lastMovie);
    state = state.copyWith(messageBord: messageBord);
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

  //値を空に戻す
  void cleanUp(){
    final newMessage = state.messages.copyWith(thumbnail: null, voiceMessage: null, image: null);
    final newMessageBord = state.messageBord.copyWith(lastMovie: null, lastPicture: null);
    receiverUserNameController.clear();
    titleMessageController.clear();
    yourNameController.clear();
    messageContentController.clear();
    lastMessageController.clear();
    state = state.copyWith(messages: newMessage, messageBord: newMessageBord);
  }
}
