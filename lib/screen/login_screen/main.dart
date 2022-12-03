import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await ref.read(authProvider).logInWithGoogle().then((value) {
                Navigator.of(context)
                .pushNamedAndRemoveUntil('/top', (route) => false);
              }).catchError((err) {
                throw Exception(err);
              });
              },
            child: const Text("google Log In"),
          )),
    );
  }
}
