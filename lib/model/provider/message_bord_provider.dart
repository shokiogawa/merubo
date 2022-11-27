import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/common_provider/firebase_fire_store.dart';
import 'package:merubo/model/entity/message.dart';
import 'package:merubo/model/entity/message_bord.dart';

final messageBordProvider = FutureProvider((ref) async {
  final fireStore = ref.read(firebaseFireStoreProvider);
  final messageBordRef = fireStore
      .collection("message_bords")
      .where("ownerUserId", isEqualTo: "JewDzzfttNl8algHI7j0")
      .withConverter<MessageBord>(
          fromFirestore: (snapshot, _) =>
              MessageBord.fromJson(snapshot.data()!),
          toFirestore: (messageBord, _) => messageBord.toJson());
  final messageBorSnapshot = await messageBordRef.get();
  final MessageBord messageBord = messageBorSnapshot.docs[0].data();
  final messageBordDocId = messageBorSnapshot.docs[0].id;

  final messagesRef = fireStore
      .collection("messages")
      .where("messageBordId", isEqualTo: messageBordDocId)
      .withConverter<Message>(
          fromFirestore: (snapshot, _) => Message.fromJson(snapshot.data()!),
          toFirestore: (message, _) => message.toJson());
  final messageSnapshot = await messagesRef.get();
  for (var message in messageSnapshot.docs) {
    messageBord.messages.add(message.data());
  }
  return messageBord;
});
