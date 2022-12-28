import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/contatn.dart';
import 'package:merubo/model/entity/template.dart';
import 'package:merubo/provider/create_message_bord_provider.dart';
import 'package:merubo/screen/message_bord_create_screen/widget/progress_app_bar.dart';
import 'package:merubo/widgets/button.dart';

class ChooseTemplateScreen extends ConsumerWidget {
  const ChooseTemplateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabList = mapTemplate.keys.toList().map((e) => Tab(text: e)).toList();
    final tabViewList = mapTemplate.values
        .toList()
        .map((e) => GridTemplate(templateList: e))
        .toList();
    return Scaffold(
      appBar: const ProgressAppBar(currentIndex: 0),
      body: DefaultTabController(
        length: mapTemplate.length,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(width: 2.0))),
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
                        borderRadius: BorderRadius.circular(25.0)),
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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.58),
        itemCount: templateList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(4.0),
                          topLeft: Radius.circular(4.0)),
                      image: DecorationImage(
                          image: AssetImage(templateList[index].image),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Button(
                            text: "プレビュー",
                            buttonColor: Colors.green.withOpacity(0.6),
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  '/preview_message_bord',
                                  arguments:
                                      describeEnum(templateList[index].type)
                              );
                            },
                          ),
                          Button(
                              text: "決定",
                              buttonColor: Colors.orange,
                              onPressed: () {
                                ref
                                    .read(createMessageBordProvider.notifier)
                                    .setType(templateList[index].type);
                                Navigator.of(context).pushNamed(
                                    '/message_bord_create_top_message_screen');
                              }),
                        ],
                      ),
                    ))
              ],
            ),
          );
        });
  }
}
