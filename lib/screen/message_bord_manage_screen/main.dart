import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/message_bord_provider.dart';
import 'package:merubo/widgets/card_button.dart';

class MessageBordManageScreen extends ConsumerWidget {
  const MessageBordManageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageBordId = ModalRoute.of(context)!.settings.arguments as String;
    final messageBord = ref.watch(selectedMessageBordId(messageBordId));
    final receiverUserName = messageBord.receiverUserName;
    return Scaffold(
      appBar: AppBar(),
      // メッセージの編集
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text('$receiverUserNameさんへの寄せ書き',
                          textAlign: TextAlign.center),
                      const SizedBox(height: 20),
                      CardButton(
                        text: "寄せ書きを確認する",
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              '/preview_message_bord',
                              arguments: messageBordId);
                        },
                      ),
                      const SizedBox(height: 20),
                      CardButton(
                        text: "寄せ書きを送る",
                        onTap: () {},
                      ),
                      const SizedBox(height: 20),
                      CardButton(
                        text: "メッセージを集める",
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Card(
                // shape:
                // const RoundedRectangleBorder(side: BorderSide(color: Colors.lightGreen)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      const Text('編集する', textAlign: TextAlign.center),
                      const SizedBox(height: 20),
                      // デザイン編集
                      const CardButton(text: "テンプレートを変更する"),
                      const SizedBox(height: 20),
                      //基本情報の編集
                      CardButton(
                          text: "基本情報を変更する",
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                '/message_bord_edit_screen',
                                arguments: messageBordId);
                          }),
                      const SizedBox(height: 20),
                      //自分が投稿したメッセージの編集
                      CardButton(
                        text: "自分のメッセージを編集する",
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              '/message_edit_screen',
                              arguments: messageBordId);
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
