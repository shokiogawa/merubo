import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/current_user_provider.dart';
import 'package:merubo/provider/message_bord_provider.dart';

class MessageBordCreatePage extends ConsumerWidget {
  const MessageBordCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider.notifier);
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
            child: const Text("確認"),
            onPressed: () async {
              currentUser.test();
              ref.watch(ownMessageBordListProvider).when(data: (value) {
                print("成功");
                print(value);
              }, error: (err, _) {
                print("失敗");
                print(err);
              }, loading: () {
                print("loading");
              });
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
