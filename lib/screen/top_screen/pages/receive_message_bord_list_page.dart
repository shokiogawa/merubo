import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/auth_provider.dart';
import 'package:merubo/provider/query/message_bord_provider.dart';
import 'package:merubo/screen/message_bord_register_screen/main.dart';
import 'package:merubo/screen/top_screen/widget/receive_message_bord_list_area.dart';

class ReceiveMessageBordList extends ConsumerWidget {
  const ReceiveMessageBordList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("MessageBordListPage");
    final asyncValue = ref.watch(receiveMessageBordListProvider);
    return asyncValue.when(
        data: (data) => Scaffold(
            drawer: Drawer(
              child: ListView(
                children: [
                  const DrawerHeader(
                      decoration: BoxDecoration(color: Colors.orangeAccent),
                      child: Center(
                          child: Text(
                        "オンライン寄せ書きアプリ",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ))),
                  ListTile(
                    leading: const Icon(Icons.logout_outlined),
                    title: const Text("ログアウト"),
                    onTap: () async {
                      await ref.watch(authProvider).logOut().then((value) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/login', (route) => false);
                      });
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.reviews),
                    title: const Text("アプリの評価"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.send),
                    title: const Text("フィードバック"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.description),
                    title: const Text("アプリの使い方🔰"),
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  const Center(child: Text("アプリケーションバージョン: 1.0.0"))
                ],
              ),
            ),
            appBar: AppBar(
              title: const Text(
                "Merubo",
                style: TextStyle(color: Colors.white),
              ),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: CircleAvatar(
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
                          ),
                          const Expanded(
                            flex: 5,
                            child: Text(
                              "Time Line",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
            body: data.isEmpty
                ? ReceiveMessageBordListArea(data: data)
                : const ExplainArea()),
        error: (err, _) => Center(child: Text(err.toString())),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}

class ExplainArea extends StatelessWidget {
  const ExplainArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        "上の＋ボタンから、これまでに受け取った寄せ書きを追加しましょう📨\n"
        "Merubo、オンライン、色紙と3種類の寄せ書きを追加することができます💌\n"
        "Meruboから寄せ書きを受け取った方は、＋ボタン押下後、「Merubo」を選択し、寄せ書きIDを入力してください📪",
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
