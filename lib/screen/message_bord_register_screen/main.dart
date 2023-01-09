import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message_bord.dart';

import 'widget/add_merubo_message_bord.dart';
import 'widget/add_online_message_bord.dart';
import 'widget/add_paper_message_bord.dart';

final selectedMessageBordType =
    StateProvider.autoDispose((ref) => MessageBordKinds.merubo);

class RegisterMessageBordScreen extends StatelessWidget {
  const RegisterMessageBordScreen({Key? key}) : super(key: key);

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
                            title: const Text("オンライン"),
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
                            title: const Text("色紙"),
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
