import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//ページ数に応じて線と円のwidgetを作成する。
class ProgressCreateMessageBord extends ConsumerWidget {
  final int totalPages;
  final int currentIndex;
  const ProgressCreateMessageBord({Key? key, required this.totalPages, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Widget> progress = [];
    for (int i = 0; i < totalPages; i++) {
      progress.add(CircleWidget(index: i, currentIndex: currentIndex));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [...progress],
    );
  }
}

//線と円を組み合わせたWidget
class CircleWidget extends StatelessWidget {
  const CircleWidget({Key? key, required this.index, required this.currentIndex}) : super(key: key);
  final int index;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: index == 0
          ? [ProgressCircle(index: index, currentIndex: currentIndex,)]
          : [const ProgressBar(), ProgressCircle(index: index, currentIndex: currentIndex,)],
    );
  }
}

//円の部分
class ProgressCircle extends ConsumerWidget {
  final int index;
  final int currentIndex;

  const ProgressCircle({Key? key, required this.index, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final currentIndex = ref.watch(currentIndexProviderForCreate);
    return CircleAvatar(
      radius: 18,
      backgroundColor: Colors.white,
      child: currentIndex > index ? const Icon(Icons.check) : null,
    );
  }
}

//線の部分
class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 20,
      color: Colors.white,
    );
  }
}
