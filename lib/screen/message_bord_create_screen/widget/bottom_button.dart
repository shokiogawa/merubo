import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../provider/create_message_bord_provider.dart';

class BottomButton extends ConsumerWidget {
  const BottomButton({Key? key, this.onPressed}) : super(key: key);
  final Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex =
        ref.read(currentIndexProviderForCreate.notifier).state;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Expanded(
              child: ElevatedButton(
                  onPressed: () {
                    //クリーンアップ
                    if(currentIndex == 1){
                      ref.read(createMessageBordProvider.notifier).cleanUp();
                    }
                    if (currentIndex != 0) {
                      ref.read(currentIndexProviderForCreate.notifier).state =
                          currentIndex - 1;
                    }
                    Navigator.of(context).pop();
                  },
                  child: const Text("戻る"))),
          const SizedBox(width: 30),
          Expanded(
              child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text("次へ")))
        ],
      ),
    );
  }
}
