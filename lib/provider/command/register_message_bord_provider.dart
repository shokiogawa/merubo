import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/model/repository/local_storage_repository.dart';
import 'package:merubo/model/repository/message_bord_repository.dart';
import 'package:merubo/provider/query/message_bord_provider.dart';
import 'package:merubo/screen/message_bord_register_screen/main.dart';
import 'package:merubo/widgets/date_form.dart';
import 'package:merubo/widgets/image_form.dart';
import 'package:uuid/uuid.dart';

final registerMessageBordProvider = Provider.autoDispose((ref) {
  final registerMessageBord = RegisterMessageBordProvider(ref);
  ref.onDispose(() {
    registerMessageBord.messageBordIdController.dispose();
  });
  return registerMessageBord;
});

class RegisterMessageBordProvider {
  RegisterMessageBordProvider(this.ref);

  final messageBordIdController = TextEditingController();
  final urlController = TextEditingController();
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final Ref ref;

  Future<void> register() async {
    await ref
        .watch(messageBordRepositoryProvider)
        .registerMessageBord(messageBordIdController.text);
    ref.invalidateSelf();
    ref.invalidate(receiveMessageBordListProvider);
  }

  Future<void> registerOnlineOrPaper() async {
    print("provider");
    String? image;
    final imagePath = ref.read(selectedImageProvider);
    final receivedAt = ref.read(selectedDateTimeProvider);
    final kinds = ref.read(selectedMessageBordType);
    final messageBordId = const Uuid().v4();
    if (imagePath.isNotEmpty) {
      print("upload image");
      image = await ref
          .read(localStorageRepositoryProvider)
          .saveImage(File(imagePath), messageBordId);
    }

    final messageBord = MessageBord(
        id: messageBordId,
        ownerUserName: nameController.text,
        category: categoryController.text,
        kinds: kinds,
        lastPicture: image,
        onlineUrl: urlController.text,
        receivedAt: receivedAt);
    await ref
        .read(messageBordRepositoryProvider)
        .registerMessageBordOnlineOrPaper(messageBord);
    // 自信をリフレッシュ
    ref.invalidateSelf();
    // 関連プロバイダーをリフレッシュ
    ref.invalidate(receiveMessageBordListProvider);
    ref.invalidate(selectedDateTimeProvider);
    ref.invalidate(selectedMessageBordType);
  }
}
