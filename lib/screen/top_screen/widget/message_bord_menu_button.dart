import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:merubo/model/entity/message_bord.dart';
import 'package:merubo/provider/command/delete_message_bord_provider.dart';
import 'package:merubo/screen/receive_message_bord_edit_screen/main.dart';
import 'package:merubo/utility/show_progress_dialog.dart';

class MessageBordMenuButton extends ConsumerWidget {
  final MessageBord messageBord;

  const MessageBordMenuButton({Key? key, required this.messageBord})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool canShowEdit = messageBord.kinds == MessageBordKinds.online ||
        messageBord.kinds == MessageBordKinds.paper;
    final displayFormat = DateFormat('yyyy年');
    final receivedAt = displayFormat.format(messageBord.receivedAt!);
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            context: context,
            builder: (BuildContext context) {
              return FractionallySizedBox(
                heightFactor: 0.2,
                child: Column(
                  children: [
                    const SizedBox(height: 7),
                    Container(
                      color: Colors.grey,
                      height: 5,
                      width: 55,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.delete_outline),
                            title: const Text(
                              "寄せ書きを削除する",
                              style: TextStyle(fontSize: 18),
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                              showNewProgressDialog(
                                  context: context,
                                  inProgressText: "削除中",
                                  beforeTitle: "寄せ書きを削除しますか？",
                                  beforeContent: "寄せ書きを削除します。この操作は取り消せません。",
                                  beforeCancelText: "キャンセル",
                                  beforeDoText: "削除",
                                  beforeDoOnPress: () async {
                                    await ref
                                        .read(deleteMessageBordProvider)
                                        .delete(messageBord.id);
                                    //TODO:削除メソッド記述
                                  },
                                  onSucceedMethod: (BuildContext context) {
                                    Navigator.of(context).pop();
                                    //TODO: メソッド成功時発火
                                  });
                            },
                          ),
                          canShowEdit
                              ? ListTile(
                                  leading: const Icon(Icons.edit_note_outlined),
                                  title: const Text(
                                    "編集する",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ReceiveMessageBordEditScreen(
                                                    messageBordId:
                                                        messageBord.id,
                                                    year: receivedAt)));
                                  },
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ],
                ),
              );
            });
      },
      icon: const Icon(
        Icons.more_vert_rounded,
        size: 20,
      ),
    );
  }
}
