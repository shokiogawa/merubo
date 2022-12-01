import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChooseTemplatePage extends ConsumerWidget {
  const ChooseTemplatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<int, List<String>> mapTemplate = {};
    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          Container(
            height: 55,
            margin: const EdgeInsets.symmetric(vertical: 20),
            color: Colors.grey[300],
            child: TabBar(
                isScrollable: true,
                indicator: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(25.0)),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(text: "結婚祝い"),
                  Tab(text: "お誕生日祝い"),
                  Tab(text: "おめでとう"),
                  Tab(text: "ありがとう"),
                  Tab(
                    text: "クリスマス",
                  )
                ]),
          ),
          const Expanded(
            child: TabBarView(
                children: [
              Center(child: Text("結婚祝い")),
              Center(child: Text("誕生日祝い")),
              Center(child: Text("おめでとう")),
              Center(child: Text("ありがとう")),
              Center(child: Text("クリスマス"))
            ]),
          )
        ],
      ),
    );
  }
}
