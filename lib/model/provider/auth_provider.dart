import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../common_provider/firebase_auth.dart';
import '../common_provider/google_auth.dart';

final authProvider = Provider<AuthProvider>((ref) => AuthProvider(ref));

class AuthProvider {
  AuthProvider(this.ref);

  final Ref ref;

  //signUp
  Future<void> signUp(String email, String password) async {
    try {
      final result = ref
          .read(firebaseAuthProvider)
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Error();
    }
  }

  //ログインしているかどうか確認
  Future<bool> checkLogIn() async {
    try {
      final currentUser = ref.watch(firebaseAuthProvider).currentUser;
      if (currentUser != null) {
        return true;
      }
      return false;
    } on FirebaseAuthException catch (e) {
      throw Error();
    }
  }

  //TODO: ドメインに変更
  Future<User?> currentUser() async {
    try {
      final currentUser = ref.watch(firebaseAuthProvider).currentUser;
      return currentUser;
    } on FirebaseAuthException catch (e) {
      throw Error();
    }
  }

  //googleログイン
  Future<void> logInWithGoogle() async {
    final googleSignIn = ref.read(googleAuthProvider);
    final firebaseAuth = ref.read(firebaseAuthProvider);
    //googleログインのリクエストを行い、認証情報を取得
    final GoogleSignInAccount? signInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await signInAccount?.authentication;

    //firebase認証に必要なcredentialを作成
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    //google認証情報を取得し、firebaseでログインする。(返り値にuserが返る)
    final firebaseUser =
        (await firebaseAuth.signInWithCredential(credential)).user;
  }

  //ログイン
  Future<void> logInWithPassword(String email, String password) async {
    try {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
    } on FirebaseAuthException catch (e) {
      throw Error();
    }
  }

  Future<void> logOut() async {
    try {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      await firebaseAuth.signOut().then((value) {});
    } on FirebaseAuthException catch (e) {
      throw Error();
    }
  }
}
