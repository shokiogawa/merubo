import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/create_message_bord_provider.dart';
import 'package:merubo/screen/message_bord_create_screen/pages/choose_template_page.dart';
import 'package:merubo/screen/message_bord_create_screen/pages/create_bottom_message_page.dart';
import 'package:merubo/screen/message_bord_create_screen/pages/create_message_page.dart';
import 'package:merubo/screen/message_bord_create_screen/pages/create_top_message_page.dart';
import 'package:merubo/screen/message_bord_create_screen/widget/bottom_button.dart';
import 'package:merubo/widgets/progress_create_message_bord.dart';

class MessageBordCreateScreen extends ConsumerWidget {
  const MessageBordCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProviderForCreate);
    final List<Widget> messageBordCreatePageList = [
      const ChooseTemplatePage(),
      const CreateTopMessagePage(),
      const CreateMessagePage(),
      const CreateBottomMessagePage()
    ];
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(12),
            child: Padding(
              padding: EdgeInsets.only(right: 40, left: 40, bottom: 5),
              child: ProgressCreateMessageBord()
            )),
        automaticallyImplyLeading: currentIndex == 0 ? true : false,
      ),
      body: messageBordCreatePageList[currentIndex],
      bottomNavigationBar: currentIndex == 0  ? null : const BottomButton(),
    );
  }
}
