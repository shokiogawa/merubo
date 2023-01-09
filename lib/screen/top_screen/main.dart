import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/repository/auth_repository.dart';
import 'package:merubo/provider/auth_provider.dart';
import 'package:merubo/provider/query/current_user_provider.dart';
import 'package:merubo/screen/message_bord_register_screen/main.dart';
import 'package:merubo/screen/top_screen/pages/message_bord_list_page.dart';
import 'package:merubo/screen/top_screen/pages/receive_message_bord_list_page.dart';

class TopScreen extends ConsumerStatefulWidget {
  const TopScreen({Key? key}) : super(key: key);

  @override
  TopScreenState createState() => TopScreenState();
}

class TopScreenState extends ConsumerState<TopScreen> {
  int _selectIndex = 0;
  late Future<void> _future;

  @override
  void initState() {
    // TODO: implement initState
    _future = ref.read(currentUserProvider.notifier).getCurrentUser();
    super.initState();
  }

  static const _pages = [ReceiveMessageBordList(), MessageBordListPage()];

  void _onChoosePage(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Merubo",
          style: TextStyle(color: Colors.white),
        ),
        bottom: _selectIndex == 0
            ? PreferredSize(
                preferredSize: const Size.fromHeight(60),
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
                                          return const RegisterMessageBordScreen();
                                        });
                                  },
                                  icon: const Icon(Icons.add))),
                        ),
                        const Expanded(
                          flex: 5,
                          child: Text(
                            "Time Line",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
            : null,
      ),
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
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/login', (route) => false);
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
      //トップページ表示前に、ユーザー情報を取得する。
      body: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error has occured"),
              );
            } else {
              return _pages[_selectIndex];
            }
          }),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onChoosePage,
        currentIndex: _selectIndex,
        items: const <BottomNavigationBarItem>[
          // BottomNavigationBarItem(icon: Icon(Icons.pages), label: "作成"),
          BottomNavigationBarItem(
              icon: Icon(Icons.gif_box), label: "受け取った寄せ書き"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "作成した寄せ書き")
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
