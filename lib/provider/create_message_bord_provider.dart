import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/model/entity/message_bord_with_message.dart';
import 'package:merubo/model/repository/firebase_storage_repository.dart';
import 'package:merubo/model/repository/message_bord_repository.dart';
import 'package:merubo/provider/current_user_provider.dart';
import 'package:uuid/uuid.dart';

// メッセージボード作成のためのprovider
final currentIndexProviderForCreate = StateProvider<int>((ref) {
  return 0;
});

final progressIndicatorProvider = StateProvider<bool>((ref) => false);

final createMessageBordProvider =
    StateNotifierProvider<CreateMessageBord, MessageBordWithMessage>((ref) {
  return CreateMessageBord(ref);
});

class CreateMessageBord extends StateNotifier<MessageBordWithMessage> {
  CreateMessageBord(this.ref)
      : super(MessageBordWithMessage(
            messageBord: MessageBord(
                id: const Uuid().v4(), receiverUserName: "", title: ""),
            messages: Message(id: const Uuid().v4())));

  @override
  void dispose() {
    print("dispose provider");
    receiverUserNameController.dispose();
    titleMessageController.dispose();
    yourNameController.dispose();
    messageContentController.dispose();
    lastMessageController.dispose();
    super.dispose();
  }

  final Ref ref;

  final receiverUserNameController = TextEditingController();
  final titleMessageController = TextEditingController();
  final yourNameController = TextEditingController();
  final messageContentController = TextEditingController();
  final lastMessageController = TextEditingController();

  void setType(MessageBordType type, String category) {
    final messageBord = state.messageBord.copyWith(type: type, category: category);
    print(messageBord.category);
    state = state.copyWith(messageBord: messageBord);
  }

  void setMessageImage(String imagePath) {
    state = state.copyWith(imagePath: imagePath);
  }

  void setMessageThumbnail(String thumbnailPath) {
    state = state.copyWith(thumbnailPath: thumbnailPath);
  }

  void setMessageBordLastPicture(String lastPicture) {
    state = state.copyWith(lastPicturePath: lastPicture);
  }

  // 保存メソッド
  Future<void> createMessageBordWithMessage() async {
    try {
      final messageBordId = state.messageBord.id;
      final messageId = state.messages.id;
      final userId = ref.watch(currentUserProvider).id;
      final firebaseStorageRepo = ref.watch(firebaseStorageRepository);

      // 画像作成
      if (state.thumbnailPath != null) {
        final thumbnailURL = await firebaseStorageRepo.uploadImage(
            File(state.thumbnailPath!),
            'message_bords/$messageBordId/messages/$messageId/thumbnail');
        final newMessage = state.messages.copyWith(thumbnail: thumbnailURL);
        state = state.copyWith(messages: newMessage);
      }

      //画像作成
      if (state.imagePath != null) {
        final imageURL = await firebaseStorageRepo.uploadImage(
            File(state.imagePath!),
            'message_bords/$messageBordId/messages/$messageId/image');
        final newMessage = state.messages.copyWith(image: imageURL);
        state = state.copyWith(messages: newMessage);
      }

      // モデルにデータ格納
      final newMessage = state.messages.copyWith(
          userName: yourNameController.text,
          content: messageContentController.text,
          userId: userId);
      final newMessageBord = state.messageBord.copyWith(
          title: titleMessageController.text,
          receiverUserName: receiverUserNameController.text,
          lastMessage: lastMessageController.text);
      state = state.copyWith(messages: newMessage, messageBord: newMessageBord);

      await ref.watch(messageBordRepositoryProvider).createMessageBord(state);
    } catch (err) {
      throw Exception("error");
    }
  }
}
