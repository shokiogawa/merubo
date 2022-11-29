import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/common_provider/firebase_fire_store.dart';
import 'package:merubo/model/entity/message_bord.dart';

//メッセージボード一覧取得
final messageBordListProvider = FutureProvider((ref) async {
  final fireStore = ref.read(firebaseFireStoreProvider);
  final messageBordRef = fireStore
      .collection("message_bords")
      .where("ownerUserId", isEqualTo: "JewDzzfttNl8algHI7j0")
      .withConverter<MessageBord>(
          fromFirestore: (snapshot, _) =>
              MessageBord.fromJson(snapshot.data()!),
          toFirestore: (messageBord, _) => messageBord.toJson());

  final messageBordSnapshot = await messageBordRef.get();
  final List<MessageBord> messageBords = [];
  for (var element in messageBordSnapshot.docs) {
    messageBords.add(element.data());
  }
  return messageBords;
});
