//TODO: ここを基点として、createScreen用のnavigatorを作成する。
// topページですでにcreateMessageBord用のscreenを作成しておく。
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:merubo/contatn.dart';
// import 'package:merubo/provider/create_message_bord_provider.dart';
// import 'package:merubo/screen/message_bord_create_screen/choose_template.dart';
// import 'package:merubo/screen/message_bord_create_screen/create_bottom_message.dart';
// import 'package:merubo/screen/message_bord_create_screen/create_message.dart';
// import 'package:merubo/screen/message_bord_create_screen/create_top_message.dart';
// import 'package:merubo/screen/message_bord_create_screen/widget/progress_create_message_bord.dart';
//
// class MessageBordCreateScreen extends ConsumerWidget {
//   const MessageBordCreateScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final currentIndex = ref.watch(currentIndexProviderForCreate);
//     // final List<Widget> messageBordCreatePageList = [
//     //   const ChooseTemplatePage(),
//     //   const CreateTopMessagePage(),
//     //   const CreateMessagePage(),
//     //   const CreateBottomMessagePage()
//     // ];
//     return Scaffold(
//       appBar: AppBar(
//         bottom: const PreferredSize(
//             preferredSize: Size.fromHeight(12),
//             child: Padding(
//                 padding: EdgeInsets.only(right: 40, left: 40, bottom: 5),
//                 child: ProgressCreateMessageBord(totalPages: 4))),
//         automaticallyImplyLeading: currentIndex == 0 ? true : false,
//       ),
//       body: const NavigatorTestWidget(),
//     );
//   }
// }
//
// class NavigatorTestWidget extends ConsumerWidget {
//   const NavigatorTestWidget({Key? key}) : super(key: key);
//
//   void push(){
//     Utility.createMessageBordNav.currentState!.push(
//       MaterialPageRoute(builder: (context){
//         return const CreateTopMessagePage();
//       })
//     );
//   }
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Navigator(
//       key: Utility.createMessageBordNav,
//       initialRoute: '/',
//       onGenerateRoute: (RouteSettings settings) {
//         late Widget page;
//         switch (settings.name) {
//           case '/':
//             page = const ChooseTemplatePage();
//             break;
//           case '/message_bord_create/create_top_message':
//             page = const CreateTopMessagePage();
//             break;
//           case '/message_bord_create/create_message_page':
//             page = const CreateMessagePage();
//             break;
//           case '/message_bord_create/create_bottom_message':
//             page = const CreateBottomMessagePage();
//             break;
//           default:
//             page = const ChooseTemplatePage();
//             break;
//         }
//         return MaterialPageRoute(builder: (context)=> page);
//         //   PageRouteBuilder(
//         //     pageBuilder: (_, __, ___) => page,
//         //     transitionDuration: const Duration(seconds: 0),
//         //   reverseTransitionDuration: const Duration(seconds: 0)
//         // );
//       },
//     );
//   }
// }
