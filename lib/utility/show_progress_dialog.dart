import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/provider/command/create_message_bord_provider.dart';

void showProgressDialog({
  required BuildContext context,
  required void Function() onPressed,
  required String inProgressText,
  required String confirmText,
  required String buttonText,
}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Consumer(builder: (context, ref, _) {
          final isInProgress = ref.watch(progressIndicatorProvider);
          final dialogHeight = MediaQuery.of(context).size.height / 5;
          return AlertDialog(
            content: isInProgress
                ? Row(
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(width: 20),
                      Text(inProgressText),
                    ],
                  )
                : SizedBox(
                    height: dialogHeight,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(confirmText),
                          ElevatedButton(
                              onPressed: onPressed,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(buttonText),
                              )),
                        ],
                      ),
                    ),
                  ),
          );
        });
      });
}
//
// Widget inLoading(BuildContext context, String inLoadingText){
//   return AlertDialog(
//     content: Row(
//       children: [
//         const CircularProgressIndicator(),
//         const SizedBox(width: 20),
//         Text(inLoadingText),
//       ],
//     ),
//   );
// }
//
// Widget beforeLoading(BuildContext context){
//   final dialogHeight = MediaQuery.of(context).size.height / 5;
//   return AlertDialog(
//     content: SizedBox(
//       height: dialogHeight,
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(confirmText),
//             ElevatedButton(
//                 onPressed: ()async{
//                   ref.read(progressIndicatorProvider.notifier).state = true;
//                   await futureMethod().then((value){
//                     ref.read(progressIndicatorProvider.notifier).state = false;
//                   });
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Text(buttonText),
//                 )),
//           ],
//         ),
//       ),
//     ),,
//   )
// }
