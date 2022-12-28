import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/provider/message_bord_provider.dart';
import 'package:timelines/timelines.dart';

class ReceiveMessageBordList extends ConsumerWidget {
  const ReceiveMessageBordList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("MessageBordListPage");
    // final asyncValue = ref.watch(ownMessageBordListProvider(Role.receiver));
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 200,
          flexibleSpace: Stack(
            children: [
              const Center(
                  child: Text(
                "寄せ書き",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
              )),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 70,
                  color: Colors.black.withOpacity(0.2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 50),
                      CircleAvatar(
                          child: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.add))),
                      const SizedBox(width: 48),
                      const Text(
                        "2019年 12月",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Row(children: [
                  const Text("12月9日", style: TextStyle(fontSize: 10)),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 150,
                      child: TimelineNode.simple(),
                    ),
                  ),
                  Flexible(
                      flex: 10,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 10, left: 0, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: Image.asset(
                                              'assets/images/chrisumasu.jpg')
                                          .image)),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "小川さんより、誕生日のお祝いが届きました",
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 15),
                                    Row(children: [
                                      const Text("参加者:"),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 2),
                                            child: CircleAvatar(
                                              backgroundImage: Image.asset(
                                                      'assets/images/chrisumasu.jpg')
                                                  .image,
                                              radius: 12,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 2),
                                            child: CircleAvatar(
                                              backgroundImage: Image.asset(
                                                      'assets/images/chrisumasu.jpg')
                                                  .image,
                                              radius: 12,
                                            ),
                                          ),
                                        ],
                                      )
                                    ]),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    const Text("参加人数: 5人")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                ]);

                //   MessageCardTile(
                //   messageBord: data[index],
                //   onTap: () {
                //     Navigator.of(context).pushNamed(
                //         '/preview_message_bord',
                //         arguments: data[index].id);
                //   },
                // );
              }),
        ),
      ),
    );
    // return asyncValue.when(
    //     data: (data) =>
    //         // FixedTimeline.tileBuilder(
    //         //   builder: TimelineTileBuilder.connectedFromStyle(
    //         //       contentsBuilder: (context, index) {
    //         //         return const Card(
    //         //           child: Padding(
    //         //             padding: EdgeInsets.all(8.0),
    //         //             child: Text("Yext"),
    //         //           ),
    //         //         );
    //         //       },
    //         //       oppositeContentsBuilder: (context, index) {
    //         //         return const Padding(
    //         //           padding: EdgeInsets.all(8.0),
    //         //           child: Text("2019年12月9日"),
    //         //         );
    //         //       },
    //         //       contentsAlign: ContentsAlign.basic,
    //         //       connectorStyleBuilder: (context, index) =>
    //         //           ConnectorStyle.solidLine,
    //         //       indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
    //         //       itemCount: 5),
    //         // ),
    //
    //     error: (err, _) => const Text("エラーだよ"),
    //     loading: () => const Center(
    //           child: CircularProgressIndicator(),
    //         ));
  }
}

// テンプレートごとの写真
String getImageByType(MessageBordType? type) {
  switch (type) {
    case MessageBordType.type1:
      return 'assets/images/chrisumasu.jpg';
    case MessageBordType.type2:
      return 'assets/images/oiwai.jpg';
    default:
      return "";
  }
}
