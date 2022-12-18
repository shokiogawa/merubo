import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/create_message_bord_provider.dart';
import 'package:merubo/screen/message_bord_create_screen/widget/progress_app_bar.dart';
import 'widget/bottom_button.dart';

class CreateBottomMessageScreen extends ConsumerWidget {
  const CreateBottomMessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createMessageProvider = ref.read(createMessageBordProvider.notifier);
    final lastMessageController = createMessageProvider.lastMessageController;
    return Scaffold(
      appBar: const ProgressAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    const Text(
                      "まとめメッセージ",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    //最後のメッセージ
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text("まとめメッセージ"),
                        ),
                        TextField(
                          controller: lastMessageController,
                          maxLines: 8,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(20),
                              hintStyle: TextStyle(fontSize: 12),
                              border: OutlineInputBorder()),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomButton(onPressed: () async {
            showProgressDialog(context, ref);
            ref.read(currentIndexProviderForCreate.notifier).state = 4;
            // メッセージボード作成メソッド
            await createMessageProvider
                .createMessageBordWithMessage()
                .then((value) {
              ref.read(progressIndicatorProvider.notifier).state = false;
              print("作成成功！！");
            }).catchError((err) {
              print(err);
            });
          })
        ],
      ),
    );
  }
}

void showProgressDialog(BuildContext context, WidgetRef ref) {
  final isInProgress = ref.watch(progressIndicatorProvider.notifier).state;
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: isInProgress
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    const Text("成功しました"),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/message_bord_complete_message_bord_screen',
                              (route) => false);
                        },
                        child: const Text("次へ"))
                  ],
                ),
        );
      });
  // showGeneralDialog(
  //   barrierColor: Colors.black.withOpacity(0.3),
  //   transitionDuration: const Duration(milliseconds: 100),
  //   barrierDismissible: false,
  //   barrierLabel: '',
  //   context: context,
  //   pageBuilder: (context, animation1, animation2) {
  //     return Center(
  //       child: isInProgress ?
  //       const CircularProgressIndicator()
  //           : Column(
  //             children: [
  //               const Text("作成に成功しました！！"),
  //               ElevatedButton(
  //               onPressed: (){
  //                 Navigator.of(context).pushNamedAndRemoveUntil('/message_bord_complete_message_bord_screen', (route) => false);
  //               },
  //               child: const Text("次へ")),
  //             ],
  //           ),
  //     );
  //   },
  // );
}
