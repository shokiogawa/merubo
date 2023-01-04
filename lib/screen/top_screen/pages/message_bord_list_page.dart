import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/provider/message_bord_provider.dart';
import 'package:merubo/widgets/menu_button.dart';
import 'package:merubo/widgets/mesage_card_tile.dart';

class MessageBordListPage extends ConsumerWidget {
  const MessageBordListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("MessageBordListPage");
    return Scaffold(
      appBar: AppBar(
          title: const Center(
              child: Text(
        "Merubo",
        style: TextStyle(color: Colors.white),
      ))),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              const Text(
                "寄せ書き一覧",
                style: TextStyle(fontSize: 20, fontFamily: 'OpenSans'),
              ),
              const SizedBox(height: 20),
              MenuButton(
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/message_bord_choose_template');
                  },
                  imagePath: 'assets/images/make_letter.jpg',
                  text: "寄せ書きを作成する"),
              const SizedBox(height: 20),
              const OwnerMessageBordList()
            ],
          ),
        ),
      ),
    );
  }
}

class OwnerMessageBordList extends ConsumerWidget {
  const OwnerMessageBordList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(ownMessageBordListProvider(Role.owner));
    return asyncValue.when(
        data: (data) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return MessageCardTile(
                  messageBord: data[index],
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        '/message_bord_manage_screen',
                        arguments: data[index].id);
                  },
                );
              });
        },
        error: (err, _) => Text(err.toString()),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
