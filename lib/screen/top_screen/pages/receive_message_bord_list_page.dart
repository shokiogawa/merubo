import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/message_bord_provider.dart';
import 'package:merubo/screen/top_screen/widget/message_bord_by_year.dart';

class ReceiveMessageBordList extends ConsumerWidget {
  const ReceiveMessageBordList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("MessageBordListPage");
    final asyncValue = ref.watch(receiveMessageBordListProvider);
    return asyncValue.when(
        data: (data) => Scaffold(
              appBar: AppBar(
                  toolbarHeight: 140,
                  flexibleSpace: Stack(
                    children: [
                      const Center(
                          child: Text(
                        "Merubo",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                          ),
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 58),
                              CircleAvatar(
                                  child: IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Scaffold(
                                                body: Column(
                                                  children: [
                                                    const SizedBox(height: 50),
                                                    IconButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        icon: const Icon(
                                                            Icons.close)),

                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                      icon: const Icon(Icons.add))),
                              const SizedBox(width: 50),
                              const Text(
                                "タイムライン",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
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
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final displayYear = data.keys.elementAt(index);
                        return MessageBordByYear(
                            displayYear: displayYear, data: data[displayYear]!);
                      }),
                ),
              ),
            ),
        error: (err, _) => Text(err.toString()),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
