import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final progressIndicatorProvider = StateProvider<bool>((ref) => false);

void showNewProgressDialog(
    {required BuildContext context,
    required String inProgressText,
    required String beforeTitle,
    required String beforeContent,
    required String beforeCancelText,
    required String beforeDoText,
    void Function(BuildContext)? onSucceedMethod,
    void Function(BuildContext)? onFailedMethod,
    Future<void> Function()? beforeDoOnPress}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Consumer(builder: (context, ref, _) {
          final isInProgress = ref.watch(progressIndicatorProvider);
          final dialogHeight = MediaQuery.of(context).size.height / 5;
          return SizedBox(
            height: dialogHeight,
            child: isInProgress
                ? InProgressAlertDialog(inProgressText: inProgressText)
                : BeforeAlertDialog(
                    title: beforeTitle,
                    content: beforeContent,
                    cancelText: beforeCancelText,
                    doText: beforeDoText,
                    cancelOnPress: (){
                      Navigator.of(context).pop();
                    },
                    doOnPress: () async {
                      ref
                          .read(progressIndicatorProvider.notifier)
                          .update((state) => true);
                      if (beforeDoOnPress != null) {
                        await beforeDoOnPress().then((value) {
                          ref
                              .read(progressIndicatorProvider.notifier)
                              .update((state) => false);
                          if (onSucceedMethod != null) {
                            onSucceedMethod(context);
                          }
                        }).catchError((err) {
                          print(err);
                          ref
                              .read(progressIndicatorProvider.notifier)
                              .update((state) => false);
                          if (onFailedMethod != null) {
                            onFailedMethod(context);
                          }
                        });
                      }
                    },
                  ),
          );
        });
      });
}

class InProgressAlertDialog extends StatelessWidget {
  final String inProgressText;

  const InProgressAlertDialog({Key? key, required this.inProgressText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          const SizedBox(width: 20),
          Text(inProgressText),
        ],
      ),
    );
  }
}

class BeforeAlertDialog extends ConsumerWidget {
  final String title;
  final String content;
  final String cancelText;
  final String doText;
  final void Function()? cancelOnPress;
  final void Function()? doOnPress;

  const BeforeAlertDialog(
      {Key? key,
      required this.title,
      required this.content,
      required this.cancelText,
      required this.doText,
      this.cancelOnPress,
      this.doOnPress})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(onTap: cancelOnPress, child: Text(cancelText)),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 8, bottom: 8, top: 8),
          child: GestureDetector(onTap: doOnPress, child: Text(doText)),
        ),
      ],
    );
  }
}
