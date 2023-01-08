import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/query/message_bord_provider.dart';
import 'package:merubo/widgets/date_form.dart';

final editReceiveMessageBordProvider = Provider((ref) {
  final instance = EditReceiveMessageBordProvider(ref);
  ref.onDispose(() {
    instance.categoryController.dispose();
    instance.userController.dispose();
    instance.categoryController.dispose();
  });
  return instance;
});

class EditReceiveMessageBordProvider {
  EditReceiveMessageBordProvider(this.ref);

  final Ref ref;
  final urlController = TextEditingController();
  final userController = TextEditingController();
  final categoryController = TextEditingController();

  void getTargetMessageBord(String year, String messageBordId) {
    final messageBord = ref
        .watch(receiveMessageBordListProvider.select((mapValues) => mapValues
            .value![year]!
            .firstWhere((data) => data.messageBord.id == messageBordId)))
        .messageBord;
    urlController.text = messageBord.onlineUrl ?? "";
    userController.text = messageBord.ownerUserName ?? "";
    categoryController.text = messageBord.category ?? "";
    ref
        .read(selectedDateTimeProvider.notifier)
        .update((state) => messageBord.receivedAt);
  }
}
