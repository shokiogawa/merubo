import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/model/entity/message_bord_with_message.dart';
import 'package:merubo/model/repository/firebase_storage_repository.dart';
import 'package:merubo/model/repository/message_bord_repository.dart';
import 'package:merubo/provider/query/message_bord_provider.dart';

final editMessageBordProvider = StateNotifierProvider.autoDispose<
    EditMessageBordProvider, MessageBordWithMessage>((ref) {
  return EditMessageBordProvider(ref);
});

class EditMessageBordProvider extends StateNotifier<MessageBordWithMessage> {
  final Ref ref;
  final receiverUserNameController = TextEditingController();
  final titleController = TextEditingController();
  final lastMessageController = TextEditingController();
  final yourNameController = TextEditingController();
  final messageContentController = TextEditingController();

  EditMessageBordProvider(this.ref)
      : super(const MessageBordWithMessage(
            messageBord: MessageBord(id: ""), messages: Message(id: "")));

  @override
  void dispose() {
    receiverUserNameController.dispose();
    titleController.dispose();
    lastMessageController.dispose();
    yourNameController.dispose();
    messageContentController.dispose();
    super.dispose();
  }

  Future<void> fetchMessageBord(String messageBordId) async {
    final messageBord = await ref
        .watch(messageBordRepositoryProvider)
        .fetchMessageBordById(messageBordId);
    receiverUserNameController.text = messageBord.receiverUserName ?? "";
    titleController.text = messageBord.title ?? "";
    lastMessageController.text = messageBord.lastMessage ?? "";
    state = state.copyWith(messageBord: messageBord);
  }

  Future<void> fetchMessage(String messageBordId) async {
    final message = await ref
        .watch(messageBordRepositoryProvider)
        .fetchMessageByMessageBordId(messageBordId);
    yourNameController.text = message.userName ?? "";
    messageContentController.text = message.content ?? "";
    state = state.copyWith(messages: message);
  }

  Future<void> updateMessageBord() async {
    final updateMessageBord = state.messageBord.copyWith(
        receiverUserName: receiverUserNameController.text,
        title: titleController.text,
        lastMessage: lastMessageController.text);
    await ref
        .watch(messageBordRepositoryProvider)
        .updateMessageBord(updateMessageBord);

    // SSTOを意識した設計
    // 自信をリフレッシュ
    ref.invalidateSelf();
    // 一覧取得データをリフレッシュ
    ref.invalidate(ownMessageBordListProvider(Role.owner));
  }

  Future<void> updateMessage(String messageBordId) async {
    final firebaseStorageRepo = ref.watch(firebaseStorageRepository);
    final messageId = state.messages.id;

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

    final updateMessage = state.messages.copyWith(
        userName: yourNameController.text,
        content: messageContentController.text);
    await ref
        .watch(messageBordRepositoryProvider)
        .updateMessage(messageBordId, updateMessage);
  }

  void setMessageThumbnail(String thumbnailPath) {
    state = state.copyWith(thumbnailPath: thumbnailPath);
  }

  void setMessageImage(String imagePath) {
    state = state.copyWith(imagePath: imagePath);
  }
}
