import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/command/register_message_bord_provider.dart';
import 'package:merubo/utility/show_progress_dialog.dart';
import 'package:merubo/widgets/button.dart';
import 'package:merubo/widgets/text_form.dart';

class AddMeruboMessageBord extends ConsumerWidget {
  const AddMeruboMessageBord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller =
        ref.watch(registerMessageBordProvider).messageBordIdController;
    final formKey = GlobalKey<FormState>();
    return Column(
      children: [
        Form(
            key: formKey,
            child: TextForm(
              controller: controller,
              label: "寄せ書きIDを入力してください",
              hintText: "寄せ書きID",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "入力してください";
                }
              },
            )),
        const SizedBox(height: 20),
        Button(
            text: "受け取る",
            buttonColor: Colors.orangeAccent,
            onPressed: () async {
              showNewProgressDialog(
                  context: context,
                  inProgressText: "受け取り中",
                  beforeTitle: "寄せ書きを受け取りますか？",
                  beforeContent: "入力した寄せ書きIDが間違っていないか確認してください。"
                      "\n寄せ書きID: ${controller.text}",
                  beforeCancelText: "キャンセル",
                  beforeDoText: "受け取る",
                  beforeDoOnPress: () async {
                    await ref.read(registerMessageBordProvider).register();
                  },
                  onSucceedMethod: (BuildContext context) {
                    print("成功");
                    Navigator.of(context).pop();
                  },
                  onFailedMethod: (BuildContext context) {
                    print("失敗");
                    Navigator.of(context).pop();
                  },
                  // beforeCancelOnPress: () {
                  //   Navigator.of(context).pop();
                  // }
                  );
              // showDialog(
              //     context: context,
              //     builder: (_) {
              //       return AlertDialog(
              //         title: const Text(
              //           "寄せ書きを受け取りますか？",
              //           style: TextStyle(fontSize: 17),
              //         ),
              //         titlePadding: const EdgeInsets.symmetric(
              //             horizontal: 20, vertical: 20),
              //         actions: [
              //           GestureDetector(
              //             child: const Text("受け取る"),
              //             onTap: (){
              //               print("やあ");
              //               Navigator.of(context).pop();
              //               showGeneralDialog(
              //                   barrierDismissible: false,
              //                   context: context,
              //                   pageBuilder: (context, animation1, animation2) {
              //                     return const Center(child: CircularProgressIndicator());
              //                   });
              //               ref
              //                   .read(registerMessageBordProvider)
              //                   .register().then((value){
              //                 Navigator.of(context).pop();
              //                 controller.clear();
              //                 ref.invalidate(receiveMessageBordListProvider);
              //               });
              //             },
              //           ),
              //           GestureDetector(
              //             child: const Padding(
              //               padding: EdgeInsets.all(8.0),
              //               child: Text("戻る"),
              //             ),
              //             onTap: () {
              //               Navigator.of(context).pop();
              //             },
              //           )
              //         ],
              //       );
              //     });
            })
      ],
    );
  }
}
