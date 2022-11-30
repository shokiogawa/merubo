import 'package:flutter/material.dart';
import 'package:merubo/screen/top_screen/pages/message_bord_create_page.dart';
import 'package:merubo/screen/top_screen/pages/message_bord_list_page.dart';

class TopScreen extends StatefulWidget {
  const TopScreen({Key? key}) : super(key: key);

  @override
  State<TopScreen> createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  static const _pages = [
    MessageBordCreatePage(),
    MessageBordListPage(),
  ];

  int _selectIndex = 0;

  void _onChoosePage(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Merubo", style: TextStyle(color: Colors.white),),),),
      body: _pages[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onChoosePage,
        currentIndex: _selectIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.pages), label: "作成"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "リスト")
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
