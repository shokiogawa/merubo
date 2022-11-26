//firebaseのサービスを提供するprovider
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProvider = Provider((ref) {
  final FirebaseAuth auth = FirebaseAuth.instance;
  return auth;
});