import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/create_message_bord_provider.dart';
import 'package:merubo/screen/message_bord_create_screen/widget/progress_create_message_bord.dart';
class ProgressAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ProgressAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProviderForCreate);
    return AppBar(
      bottom: const PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: ProgressCreateMessageBord(totalPages: 4))),
      automaticallyImplyLeading: currentIndex == 0 ? true : false,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80);
}
