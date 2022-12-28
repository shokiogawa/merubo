import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/screen/message_bord_create_screen/widget/progress_create_message_bord.dart';
class ProgressAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final int currentIndex;
  const ProgressAppBar({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final currentIndex = ref.watch(currentIndexProviderForCreate);
    return AppBar(
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: ProgressCreateMessageBord(totalPages: 4, currentIndex: currentIndex))),
      automaticallyImplyLeading: currentIndex == 0 ? true : false,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(80);
}
