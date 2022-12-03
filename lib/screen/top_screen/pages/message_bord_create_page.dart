import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/auth_provider.dart';

class MessageBordCreatePage extends ConsumerWidget {
  const MessageBordCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: ElevatedButton(
              child: const Text("メッセージ作成画面に遷移"),
              onPressed: () {
                //親から子へ遷移する。
                Navigator.pushNamed(context, '/message_bord_create');
              },
            ),
          ),
          ElevatedButton(
            child: const Text("ログアウト"),
            onPressed: () {
              //親から子へ遷移する。
              ref.read(authProvider).logOut().then((value) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/login', (route) => false);
                // Navigator.of(context).pushAndRemoveUntil(
                //     MaterialPageRoute(
                //         builder: (context) => const LoginScreen()),
                //     (route) => false);
              });
            },
          ),
        ],
      ),
    );
  }
}
