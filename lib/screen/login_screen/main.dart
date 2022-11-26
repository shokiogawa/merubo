import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:merubo/model/provider/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await ref
            .read(authProvider)
            .currentUser()
            .then((value) => print(value));
      }),
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
