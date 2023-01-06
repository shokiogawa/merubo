import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/provider/message_bord_provider.dart';
import 'package:merubo/screen/top_screen/widget/add_merubo_message_bord.dart';
import 'package:merubo/screen/top_screen/widget/add_online_message_bord.dart';
import 'package:merubo/screen/top_screen/widget/add_paper_message_bord.dart';
import 'package:merubo/screen/top_screen/widget/message_bord_by_year.dart';
import 'package:merubo/screen/top_screen/widget/receive_message_bord_list_area.dart';

import '../../../model/entity/message_bord_with_messages.dart';

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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            body: data.isNotEmpty
                ? ReceiveMessageBordListArea(data: data)
                : Container()),
        error: (err, _) => Center(child: Text(err.toString())),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}



final selectedMessageBordType = StateProvider((ref) => MessageBordKinds.merubo);

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
                            title: const Text("Merubo"),
                            leading: Radio(
                                value: MessageBordKinds.merubo,
                                groupValue: messageBordType,
                                onChanged: (value) {
                                  ref
                                      .read(selectedMessageBordType.notifier)
                                      .update((state) => value!);
                                }),
                          ),
                          ListTile(
                            title: const Text("オンライン寄せ書き"),
                            leading: Radio(
                                value: MessageBordKinds.online,
                                groupValue: messageBordType,
                                onChanged: (value) {
                                  ref
                                      .read(selectedMessageBordType.notifier)
                                      .update((state) => value!);
                                }),
                          ),
                          ListTile(
                            title: const Text("紙の寄せ書き"),
                            leading: Radio(
                                value: MessageBordKinds.paper,
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
                        child: messageBordType == MessageBordKinds.merubo
                            ? const AddMeruboMessageBord()
                            : messageBordType == MessageBordKinds.online
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
