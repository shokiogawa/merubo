import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/message_bord_provider.dart';
import 'package:merubo/widgets/mesage_card.dart';

class MessageBordListPage extends ConsumerWidget {
  const MessageBordListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("MessageBordListPage");
    final asyncValue = ref.watch(ownMessageBordListProvider);
    return asyncValue.when(
        data: (data) => SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "寄せ書き一覧",
                      style: TextStyle(fontSize: 20, fontFamily: 'OpenSans'),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MessageCard(messageBord: data[index]);
                      }),
                ],
              ),
            ),
        // GridView.builder(
        // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     // crossAxisSpacing: 10,
        //     crossAxisCount: 1),
        // itemCount: data.length,
        // itemBuilder: (context, index) {
        //   return MessageCard(messageBord: data[index]);
        // }),
        error: (err, _) => const Text("エラーだよ"),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
