import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/contatn.dart';
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
          GestureDetector(
            onTap: () {
              // Utility.createMessageBordNav.currentState!.pushNamed(routeName)
              Navigator.pushNamed(context, '/message_bord_choose_template');
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: Card(
                  color: Colors.orangeAccent,
                  child: Center(child: Text("寄せ書きを作成する", style: TextStyle(color: Colors.white),)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
