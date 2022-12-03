import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/common_provider/firebase_fire_store.dart';
import 'package:merubo/model/entity/message.dart';
import 'package:merubo/model/entity/message_bord.dart';

// final messageBordProvider = FutureProvider.family((ref, id) async {
//   final fireStore = ref.read(firebaseFireStoreProvider);
//   final messageBordRef = fireStore
//       .collection("message_bords")
//       .where("id", isEqualTo: id.toString())
//       .withConverter<MessageBord>(
//           fromFirestore: (snapshot, _) =>
//               MessageBord.fromJson(snapshot.data()!),
//           toFirestore: (messageBord, _) => messageBord.toJson()).limit(1);
//   final messageBorSnapshot = await messageBordRef.get();
//   final MessageBord messageBord = messageBorSnapshot.docs[0].data();
//
//   final messagesRef = fireStore
//       .collection("messages")
//       .where("messageBordId", isEqualTo: id.toString())
//       .withConverter<Message>(
//           fromFirestore: (snapshot, _) => Message.fromJson(snapshot.data()!),
//           toFirestore: (message, _) => message.toJson());
//   final messageSnapshot = await messagesRef.get();
//   final List<Message> messages = [];
//   for (var message in messageSnapshot.docs) {
//     messages.add(message.data());
//   }
//   final newMessages = messageBord.copyWith(messages: messages);
//   return newMessages;
// });
