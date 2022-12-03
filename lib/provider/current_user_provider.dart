import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/user.dart';
import 'package:merubo/model/repository/auth_repository.dart';

final currentUserProvider = StateNotifierProvider<CurrentUserProvider, User>((ref) => CurrentUserProvider(ref));

// ユーザー情報を管理するprovider
class CurrentUserProvider extends StateNotifier<User> {
  CurrentUserProvider(this.ref) : super(const User(id: ""));

  final Ref ref;

  Future<void> getCurrentUser() async {
    final currentUser = await ref.watch(authRepositoryProvider).getCurrentUser();
    state = state.copyWith(
        id: currentUser.id,
        email: currentUser.email,
        phoneNumber: currentUser.phoneNumber,
        displayName: currentUser.displayName);
  }

  test(){
    print(state.id);
  }
}
