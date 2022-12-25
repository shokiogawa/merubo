import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/create_message_bord_provider.dart';
import 'package:merubo/screen/message_bord_create_screen/widget/progress_app_bar.dart';

class CompleteMessageBord extends ConsumerWidget {
  const CompleteMessageBord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageBord = ref.watch(createMessageBordProvider);
    return Scaffold(
      appBar: const ProgressAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
              onPressed: () {
                //TODO: LINEかメールで寄せ書きを送信する。(idとともに)
                // 送信方法を選択してください。→ 送信完了 → 送信完了しました。
              },
              child: const Text("寄せ書きを送る")),
          ElevatedButton(
              onPressed: () {
                //TODO: URLを共有し寄せ書きを集めよう。
                // TODO: LINE and E-mailで共有可能(twitter、Facebookもいずれ可能)
              },
              child: const Text("他の人から寄せ書きを集める")),
          ElevatedButton(
              onPressed: () {
                // stateで保持しているデータを取得
                final messageBordId =
                    ref.read(createMessageBordProvider).messageBord.id;
                // 遷移
                Navigator.of(context).pushNamed('/preview_message_bord',
                    arguments: messageBordId);
              },
              child: const Text("作成した寄せ書きを表示する")),
          ElevatedButton(
              onPressed: () {},
              child: const Text("作成した寄せ書きを編集する")),
          ElevatedButton(
              onPressed: () {}, child: const Text("寄せ書きにメッセージを追加する。")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/top', (route) => false);
                ref.invalidate(createMessageBordProvider);
              },
              child: const Text("戻る")),
        ],
      ),
    );
  }
}
