import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/repository/auth_repository.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

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
              .then((value) => print("成功"))
              .catchError((err) {
            print(err);
          });
        },
        child: const Text("google Log In"),
      )),
    );
  }
}
