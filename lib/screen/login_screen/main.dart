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
          await ref
              .read(authProvider)
              .logInWithGoogle()
              .then((value) => GoRouter.of(context).push('/'))
              .catchError((err) {
            print(err);
          });
        },
        child: const Text("google Log In"),
      )),
    );
  }
}
