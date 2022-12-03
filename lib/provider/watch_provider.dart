import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/common_provider/firebase_fire_store.dart';
import 'package:merubo/provider/current_user_provider.dart';

final test = Provider((ref) {
  final userId = ref.watch(currentUserProvider).id;
  final fireStore = ref.watch(firebaseFireStoreProvider);
  final snapshot = fireStore
      .collection("users")
      .doc(userId)
      .collection("own_message_bords")
      .snapshots();
});
