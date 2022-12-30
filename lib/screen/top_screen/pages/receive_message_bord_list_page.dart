import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/message_bord_provider.dart';
import 'package:merubo/provider/register_message_bord_provider.dart';
import 'package:merubo/screen/top_screen/widget/message_bord_by_year.dart';
import 'package:merubo/widgets/button.dart';
import 'package:merubo/widgets/image_form.dart';
import 'package:merubo/widgets/text_form.dart';

class ReceiveMessageBordList extends ConsumerWidget {
  const ReceiveMessageBordList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("MessageBordListPage");
    final asyncValue = ref.watch(receiveMessageBordListProvider);
    return asyncValue.when(
        data: (data) => Scaffold(
              appBar: AppBar(
                  toolbarHeight: 140,
                  flexibleSpace: Stack(
                    children: [
                      const Center(
                          child: Text(
                        "Merubo",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                          ),
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 58),
                              CircleAvatar(
                                  child: IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return const AddMessageBord();
                                            });
                                      },
                                      icon: const Icon(Icons.add))),
                              const SizedBox(width: 50),
                              const Text(
                                "タイムライン",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final displayYear = data.keys.elementAt(index);
                        return MessageBordByYear(
                            displayYear: displayYear, data: data[displayYear]!);
                      }),
                ),
              ),
            ),
        error: (err, _) => Text(err.toString()),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}

enum MessageBordType {
  merubo("Merubo"),
  online("オンライン"),
  paper("紙");

  final String displayName;

  const MessageBordType(this.displayName);
}

final selectedMessageBordType = StateProvider((ref) => MessageBordType.merubo);

class AddMessageBord extends StatelessWidget {
  const AddMessageBord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close)),
            Column(
              children: [
                const Text("どの寄せ書きえお受け取りましたか?"),
                Consumer(builder: (BuildContext context, WidgetRef ref, _) {
                  final messageBordType = ref.watch(selectedMessageBordType);
                  return Column(
                    children: [
                      Column(
                        children: [
                          ListTile(
                            title: Text(MessageBordType.merubo.displayName),
                            leading: Radio(
                                value: MessageBordType.merubo,
                                groupValue: messageBordType,
                                onChanged: (value) {
                                  ref
                                      .read(selectedMessageBordType.notifier)
                                      .update((state) => value!);
                                }),
                          ),
                          ListTile(
                            title: Text(MessageBordType.online.displayName),
                            leading: Radio(
                                value: MessageBordType.online,
                                groupValue: messageBordType,
                                onChanged: (value) {
                                  ref
                                      .read(selectedMessageBordType.notifier)
                                      .update((state) => value!);
                                }),
                          ),
                          ListTile(
                            title: Text(MessageBordType.paper.displayName),
                            leading: Radio(
                                value: MessageBordType.paper,
                                groupValue: messageBordType,
                                onChanged: (value) {
                                  ref
                                      .read(selectedMessageBordType.notifier)
                                      .update((state) => value!);
                                }),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // 追加ページ
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: messageBordType == MessageBordType.merubo
                            ? const AddMeruboMessageBord()
                            : messageBordType == MessageBordType.online
                                ? const AddOnlineMessageBord()
                                : const AddPaperMessageBord(),
                      )
                    ],
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AddPaperMessageBord extends StatelessWidget {
  const AddPaperMessageBord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Column(
      children: [
        Form(
            key: formKey,
            child: Column(
              children: [
                const TextForm(
                  label: "誰から受け取りましたか？",
                  hintText: "名前",
                ),
                const SizedBox(height: 20),
                const TextForm(
                  label: "なんのお祝いですか？",
                  hintText: "高校卒業、部活引退など",
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("受け取り日"),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: ()async{
                        final DateTime? selectedDate = await showDatePicker(
                            locale: const Locale("ja"),
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                            border: Border.all(color: Colors.grey)),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "yyyy年MM月DD日",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ImageForm(
                  coverText: "寄せ書きの写真",
                  onChange: (value){
                    print(value);
                  },
                ),
              ],
            )),
        Button(text: "登録", buttonColor: Colors.orangeAccent, onPressed: () {})
      ],
    );
  }
}


class AddOnlineMessageBord extends StatelessWidget {
  const AddOnlineMessageBord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Column(
      children: [
        Form(
            key: formKey,
            child: Column(
              children: [
                const TextForm(
                  label: "寄せ書きのURLを入力",
                  hintText: "https://merubo.com/yosegaki",
                ),
                const SizedBox(height: 20),
                const TextForm(
                  label: "誰から受け取りましたか？",
                  hintText: "名前",
                ),
                const SizedBox(height: 20),
                const TextForm(
                  label: "なんのお祝いですか？",
                  hintText: "高校卒業、部活引退など",
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("受け取り日"),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: ()async{
                        final DateTime? selectedDate = await showDatePicker(
                          locale: const Locale("ja"),
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4.0)),
                            border: Border.all(color: Colors.grey)),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "yyyy年MM月DD日",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            )),
        Button(text: "登録", buttonColor: Colors.orangeAccent, onPressed: () {})
      ],
    );
  }
}

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
              // ローディング開始
              showGeneralDialog(
                  barrierDismissible: false,
                  context: context,
                  pageBuilder: (context, animation1, animation2) {
                    return const Center(child: CircularProgressIndicator());
                  });
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: const Text(
                        "取得に失敗しました",
                        style: TextStyle(fontSize: 17),
                      ),
                      titlePadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      actions: [
                        GestureDetector(
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("戻る"),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                  });
            })
      ],
    );
  }
}
