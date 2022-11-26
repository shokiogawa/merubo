import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MessageBordListPage extends StatelessWidget {
  const MessageBordListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          child: const Text("メッセージボードページに遷移"),
        onPressed: (){
            //親から子へ遷移する。
          context.push('/message_bord');
        },
      ),
    );
  }
}
