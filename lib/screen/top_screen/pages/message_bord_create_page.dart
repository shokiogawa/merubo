import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/auth_provider.dart';
import 'package:merubo/provider/message_bord_provider.dart';

class MessageBordCreatePage extends ConsumerWidget {
  const MessageBordCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("MessageBordCreatePage");
    final auth = ref.watch(authProvider);
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
            onPressed: () async {
              ref.refresh(ownMessageBordListProvider);
              //親から子へ遷移する。
              // await auth.logOut().then((value) {
              //   Navigator.of(context)
              //       .pushNamedAndRemoveUntil('/login', (route) => false);
              // });
            },
          ),
        ],
      ),
    );
  }
}
