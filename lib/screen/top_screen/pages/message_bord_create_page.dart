import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/register_message_bord_provider.dart';
import 'package:merubo/widgets/button.dart';
import 'package:merubo/widgets/menu_button.dart';

class MessageBordCreatePage extends ConsumerWidget {
  const MessageBordCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("MessageBordCreatePage");
    final controller =
        ref.watch(registerMessageBordProvider).messageBordIdController;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Merubo",
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              MenuButton(
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/message_bord_choose_template');
                  },
                  imagePath: 'assets/images/make_letter.jpg',
                  text: "寄せ書きを作成する"),
              const SizedBox(height: 20),
              MenuButton(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 5,
                                    width: 80,
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  // const Text("寄せ書きIDを入力してください"),
                                  Form(
                                      child: TextFormField(
                                    controller: controller,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintStyle: TextStyle(fontSize: 12),
                                        contentPadding: EdgeInsets.all(10),
                                        hintText: "寄せ書きIDを入力してください"),
                                  )),
                                  const SizedBox(height: 20),
                                  Button(
                                      text: "受け取る",
                                      buttonColor: Colors.orangeAccent,
                                      onPressed: () async {
                                        // ローディング開始
                                        showGeneralDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            pageBuilder: (context, animation1,
                                                animation2) {
                                              return const Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            });
                                        await ref
                                            .read(registerMessageBordProvider)
                                            .register()
                                            .then((value) {
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pushNamed(
                                              '/preview_message_bord',
                                              arguments: controller.text);
                                          controller.clear();
                                        }).catchError((err) {
                                          Navigator.of(context).pop();
                                          controller.clear();
                                          showDialog(
                                              context: context,
                                              builder: (_) {
                                                return AlertDialog(
                                                  title: const Text(
                                                    "取得に失敗しました",
                                                    style:
                                                        TextStyle(fontSize: 17),
                                                  ),
                                                  titlePadding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20,
                                                      vertical: 20),
                                                  actions: [
                                                    GestureDetector(
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text("戻る"),
                                                      ),
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    )
                                                  ],
                                                );
                                              });
                                        });
                                      })
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  imagePath: 'assets/images/make_letter.jpg',
                  text: "寄せ書きを受け取る")
            ],
          ),
        ),
      ),
    );
  }
}
