import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/provider/message_bord_list_provider.dart';

class MessageBordListPage extends ConsumerWidget {
  const MessageBordListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(messageBordListProvider);
    return asyncValue.when(
        data: (data) => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed('/message_bord', arguments: data[index].id);
                  },
                    child: Text(data[index].receiverUserName)),
              );
            }),
        error: (err, _) => const Text("エラーだよ"),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
    //   Center(
    //   child: ElevatedButton(
    //     child: const Text("メッセージボードページに遷移"),
    //     onPressed: () {
    //       Navigator.pushNamed(context, '/message_bord');
    //     },
    //   ),
    // );
  }
}
