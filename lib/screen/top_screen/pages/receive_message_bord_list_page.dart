import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/query/message_bord_provider.dart';
import 'package:merubo/screen/top_screen/widget/receive_message_bord_list_area.dart';

class ReceiveMessageBordList extends ConsumerWidget {
  const ReceiveMessageBordList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("MessageBordListPage");
    final asyncValue = ref.watch(receiveMessageBordListProvider);
    return asyncValue.when(
        data: (data) => data.isNotEmpty
            ? ReceiveMessageBordListArea(data: data)
            : const ExplainArea(),
        error: (err, _) => Center(child: Text(err.toString())),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}

class ExplainArea extends StatelessWidget {
  const ExplainArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        "上の＋ボタンから、これまでに受け取った寄せ書きを追加しましょう📨\n"
        "Merubo、オンライン、色紙と3種類の寄せ書きを追加することができます💌\n"
        "Meruboから寄せ書きを受け取った方は、＋ボタン押下後、「Merubo」を選択し、寄せ書きIDを入力してください📪",
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
