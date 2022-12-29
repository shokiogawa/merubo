import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/current_user_provider.dart';
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

  static const _pages = [
    MessageBordListPage(),
    ReceiveMessageBordList()
  ];

  void _onChoosePage(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Center(
      //     child: Text(
      //       "Merubo",
      //       style: TextStyle(color: Colors.white),
      //     ),
      //   ),
      // ),
      //トップページ表示前に、ユーザー情報を取得する。
      body: FutureBuilder(
        future: _future,
          builder: (context, snapshot){
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
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "作成した寄せ書き"),
          BottomNavigationBarItem(icon: Icon(Icons.gif_box), label: "受け取った寄せ書き")
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
