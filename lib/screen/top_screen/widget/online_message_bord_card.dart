import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/provider/query/hp_info_provider.dart';
import 'package:merubo/screen/top_screen/widget/message_bord_menu_button.dart';
import 'package:url_launcher/url_launcher.dart';

class OnlineMessageBordCard extends ConsumerWidget {
  final MessageBord messageBord;

  const OnlineMessageBordCard({Key? key, required this.messageBord})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(hpInfoProvider(messageBord.onlineUrl!));
    final sendUserName = messageBord.ownerUserName;
    final category = messageBord.category;
    return asyncValue.when(data: (data) {
      final hpTitle = data['title'];
      final hpImage = data['image'];
      return GestureDetector(
        onTap: () async {
          final url = messageBord.onlineUrl;
          if (url != null) {
            if (!await launchUrl(Uri.parse(url))) {
              throw 'Could not launch $url';
            }
          }
        },
        child: Card(
          child: Padding(
            padding:
                const EdgeInsets.only(right: 10, left: 0, top: 10, bottom: 10),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: Image.network(hpImage!).image,
                    )),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$sendUserNameさんより、$categoryのお祝いが届きました',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Text(
                                '$hpTitle',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )),
                          Expanded(
                              flex: 1, child: MessageBordMenuButton(messageBord: messageBord,))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }, error: (err, _) {
      return const Center(child: Text("取得に失敗しました。"));
    }, loading: () {
      return const Center(child: Text("データ取得中。。。"));
    });
  }
}
