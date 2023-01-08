import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                          fontSize: 20),
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
                                            return const AddMessageBord();
                                          });
                                    },
                                    icon: const Icon(Icons.add))),
                            const SizedBox(width: 50),
                            const Text(
                              "タイムライン",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            body: data.isNotEmpty
                ? ReceiveMessageBordListArea(data: data)
                : Container()),
        error: (err, _) => Center(child: Text(err.toString())),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}




