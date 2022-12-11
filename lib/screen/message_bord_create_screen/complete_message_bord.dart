import 'package:flutter/material.dart';
import 'package:merubo/screen/message_bord_create_screen/widget/progress_app_bar.dart';

class CompleteMessageBord extends StatelessWidget {
  const CompleteMessageBord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProgressAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
              onPressed: (){
                //TODO: LINEかメールで寄せ書きを送信する。(idとともに)
                // 送信方法を選択してください。→ 送信完了 → 送信完了しました。
              },
              child: const Text("寄せ書きを送る")
          ),
          ElevatedButton(
              onPressed: (){
                //TODO: URLを共有し寄せ書きを集めよう。
                // TODO: LINE and E-mailで共有可能(twitter、Facebookもいずれ可能)
              },
              child: const Text("他の人から寄せ書きを集める")),
          ElevatedButton(
              onPressed: (){
              },
              child: const Text("作成した寄せ書きを表示する")),
          ElevatedButton(
              onPressed: (){
              },
              child: const Text("作成した寄せ書きを編集する")),
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).pushNamedAndRemoveUntil('/top', (route) => false);
              },
              child: const Text("戻る")),
        ],
      ),
    );
  }
}
