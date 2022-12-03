import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/repository/auth_repository.dart';

final authProvider = Provider((ref) => AuthProvider(ref));

class AuthProvider {
  final Ref ref;
  AuthProvider(this.ref);
  // ログアウト
  Future<void> logOut() async {
    await ref.read(authRepositoryProvider).logOut();
  }

  //メアドとパスワードでログイン
  Future<void> logInWithEmailAndPassword(String email, String password)async{
    await ref.read(authRepositoryProvider).logInWithPassword(email, password);
  }

  //Googleログイン
  Future<void> logInWithGoogle()async{
    await ref.read(authRepositoryProvider).logInWithGoogle();
  }

  //ログインしているかどうか確認
Future<bool> checkLogin()async{
  return (await ref.watch(authRepositoryProvider).checkLogIn());
}
}
