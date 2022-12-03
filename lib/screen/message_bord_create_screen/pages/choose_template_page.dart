import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/contatn.dart';
import 'package:merubo/model/entity/template.dart';

class ChooseTemplatePage extends ConsumerWidget {
  const ChooseTemplatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabList = mapTemplate.keys.toList().map((e) => Tab(text: e)).toList();
    final tabViewList = mapTemplate.values
        .toList()
        .map((e) => GridTemplate(templateList: e))
        .toList();
    return DefaultTabController(
      length: mapTemplate.length,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 2.0)
                )
              ),
              child: const Text(
                "寄せ書きテンプレートを選択",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              height: 40,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: TabBar(
                  isScrollable: true,
                  indicator: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25.0)
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: tabList),
            ),
            Expanded(
              child: TabBarView(children: tabViewList),
            )
          ],
        ),
      ),
    );
  }
}

class GridTemplate extends ConsumerWidget {
  const GridTemplate({Key? key, required this.templateList}) : super(key: key);
  final List<Template> templateList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: templateList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.of(context)
                  .pushNamed('/preview_message_bord', arguments: templateList[index].type);
            },
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(templateList[index].image), fit: BoxFit.fill),
                ),
              ),
            ),
          );
        });
  }
}
