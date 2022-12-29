import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/create_message_bord_provider.dart';
import 'package:merubo/screen/message_bord_create_screen/widget/progress_app_bar.dart';
import 'package:merubo/utility/show_progress_dialog.dart';
import 'widget/bottom_button.dart';

class CreateBottomMessageScreen extends ConsumerWidget {
  const CreateBottomMessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createMessageProvider = ref.watch(createMessageBordProvider.notifier);
    final lastMessageController = createMessageProvider.lastMessageController;
    return Scaffold(
      appBar: const ProgressAppBar(currentIndex: 3),
      bottomNavigationBar: BottomButton(onPressed: () {
        showProgressDialog(
            context: context,
            onPressed: () async {
              ref.read(progressIndicatorProvider.notifier).state = true;
              // await Future.delayed(const Duration(seconds: 3)).then((value) {
              //   ref.read(progressIndicatorProvider.notifier).state = false;
              //   ref.read(currentIndexProviderForCreate.notifier).state = 4;
              //   //画面遷移
              //   Navigator.of(context).pushNamedAndRemoveUntil(
              //       '/message_bord_complete_message_bord_screen',
              //       (route) => false);
              // });
              await ref
                  .read(createMessageBordProvider.notifier)
                  .createMessageBordWithMessage()
                  .then((value) {
                ref
                    .read(progressIndicatorProvider.notifier)
                    .state = false;
                //画面遷移
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/message_bord_complete_message_bord_screen',
                    (route) => false);
              }).catchError((err) {
                print(err);
              });
            },
            inProgressText: '作成中',
            confirmText: '寄せ書きを作成しますか？',
            buttonText: '作成');
      }),
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
        ],
      ),
    );
  }
}

// void showProgressDialog(BuildContext context) {
//   showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (context) {
//         return Consumer(builder: (context, ref, _) {
//           final isInProgress = ref.watch(progressIndicatorProvider);
//           final dialogHeight = MediaQuery.of(context).size.height / 5;
//           return AlertDialog(
//             content: isInProgress
//                 ? Row(
//                     // crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       CircularProgressIndicator(),
//                       SizedBox(width: 20),
//                       Text("作成中"),
//                     ],
//                   )
//                 : SizedBox(
//                     height: dialogHeight,
//                     child: Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           const Text("寄せ書きを作成しますか？"),
//                           ElevatedButton(
//                               onPressed: () async {
//                                 ref
//                                     .read(progressIndicatorProvider.notifier)
//                                     .state = true;
//                                 await Future.delayed(const Duration(seconds: 3))
//                                     .then((value) {
//                                   ref
//                                       .read(progressIndicatorProvider.notifier)
//                                       .state = false;
//                                   ref
//                                       .read(
//                                       currentIndexProviderForCreate.notifier)
//                                       .state = 4;
//                                   //画面遷移
//                                   Navigator.of(context).pushNamedAndRemoveUntil(
//                                       '/message_bord_complete_message_bord_screen',
//                                           (route) => false);
//                                 });
//
//                                 // メッセージボード作成メソッド
//                                 // await ref
//                                 //     .read(createMessageBordProvider.notifier)
//                                 //     .createMessageBordWithMessage()
//                                 //     .then((value) {
//                                 //   ref
//                                 //       .read(progressIndicatorProvider.notifier)
//                                 //       .state = false;
//                                 //   //画面遷移
//                                 //   Navigator.of(context).pushNamedAndRemoveUntil(
//                                 //       '/message_bord_complete_message_bord_screen',
//                                 //       (route) => false);
//                                 // }).catchError((err) {
//                                 //   print(err);
//                                 // });
//                               },
//                               child: const Padding(
//                                 padding: EdgeInsets.all(20.0),
//                                 child: Text("作成する"),
//                               )),
//                         ],
//                       ),
//                     ),
//                   ),
//           );
//         });
//       });
// }
