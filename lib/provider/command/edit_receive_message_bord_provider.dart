import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/model/repository/local_storage_repository.dart';
import 'package:merubo/model/repository/message_bord_repository.dart';
import 'package:merubo/provider/query/message_bord_provider.dart';
import 'package:merubo/widgets/date_form.dart';
import 'package:merubo/widgets/image_form.dart';

final editReceiveMessageBordProvider = StateNotifierProvider.autoDispose<
    EditReceiveMessageBordProvider,
    MessageBord>((ref) => EditReceiveMessageBordProvider(ref));

class EditReceiveMessageBordProvider extends StateNotifier<MessageBord> {
  EditReceiveMessageBordProvider(this.ref) : super(const MessageBord(id: ""));
  final Ref ref;
  final urlController = TextEditingController();
  final userController = TextEditingController();
  final categoryController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    urlController.dispose();
    userController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  void fetch(String year, String messageBordId) {
    final messageBord = ref
        .watch(receiveMessageBordListProvider.select((mapValues) => mapValues
            .value![year]!
            .firstWhere((data) => data.messageBord.id == messageBordId)))
        .messageBord;
    state = messageBord;

    urlController.text = messageBord.onlineUrl ?? "";
    userController.text = messageBord.ownerUserName ?? "";
    categoryController.text = messageBord.category ?? "";
    ref
        .read(selectedDateTimeProvider.notifier)
        .update((state) => messageBord.receivedAt);
    if (messageBord.lastPicture != null) {
      ref
          .read(selectedImageProvider.notifier)
          .update((state) => messageBord.lastPicture!);
    }
  }

  Future<void> edit() async {
    final kinds = state.kinds;
    final selectedImagePath = ref.read(selectedImageProvider);
    print(selectedImagePath);
    final receivedAt = ref.read(selectedDateTimeProvider);
    if (kinds == MessageBordKinds.paper && selectedImagePath.isNotEmpty) {
      final imagePath = await ref
          .watch(localStorageRepositoryProvider)
          .saveImage(File(selectedImagePath), state.id);
      state = state.copyWith(lastPicture: imagePath);
    }
    state = state.copyWith(
        onlineUrl: urlController.text,
        ownerUserName: userController.text,
        category: categoryController.text,
        receivedAt: receivedAt);
    await ref.watch(messageBordRepositoryProvider).updateMessageBord(state);
    ref.invalidate(receiveMessageBordListProvider);
  }
}
