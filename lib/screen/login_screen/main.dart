// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:merubo/provider/auth_provider.dart';
//
// class LoginScreen extends ConsumerWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       body: Center(
//           child: ElevatedButton(
//             onPressed: () async {
//               await ref.read(authProvider).logInWithGoogle().then((value) {
//                 Navigator.of(context)
//                 .pushNamedAndRemoveUntil('/top', (route) => false);
//               }).catchError((err) {
//                 throw Exception(err);
//               });
//               },
//             child: const Text("google Log In"),
//           )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:merubo/provider/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);
    return FlutterLogin(
      title: 'Merubo',
      onLogin: (data) async {
        await auth
            .logInWithEmailAndPassword(data.name, data.password)
            .catchError((err) {
          throw Exception(err);
        });
        return null;
      },
      onSignup: (data) async {
        await auth
            .signUp(data.name!, data.password!)
            .catchError((err) {
          throw Exception(err);
        });
        return null;
      },
      loginProviders: <LoginProvider>[
        LoginProvider(
          icon: FontAwesomeIcons.google,
          label: 'Google',
          callback: () async {
            await ref.read(authProvider).logInWithGoogle().catchError((err) {
              print(err);
            });
          },
        ),
      ],
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushNamedAndRemoveUntil('/top', (route) => false);
      },
      onRecoverPassword: (value) {
        print(value);
      },
    );
  }
}
