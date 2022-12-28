import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/repository/message_bord_repository.dart';

// final messageBordIdController = Provider.autoDispose((ref){
//   final controller = TextEditingController();
//   ref.onDispose(() {
//     controller.dispose();
//   });
//   return controller;
// });

final registerMessageBordProvider = Provider.autoDispose((ref){
  final registerMessageBord = RegisterMessageBordProvider(ref);
   ref.onDispose(() {
     registerMessageBord.messageBordIdController.dispose();
  });
  return registerMessageBord;
});

class RegisterMessageBordProvider {
  RegisterMessageBordProvider(this.ref);
  final messageBordIdController = TextEditingController();
  final Ref ref;

  Future<void> register() async {
    await ref
        .watch(messageBordRepositoryProvider)
        .registerMessageBord(messageBordIdController.text);
  }
}
