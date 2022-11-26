import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/common_provider/firebase_fire_store.dart';

class UserRepository {
  final Ref ref;

  const UserRepository(this.ref);

  //データ取得
  Future<void> fetch() async {
    final users = ref.read(firebaseFireStoreProvider).collection('users');
  }
}
