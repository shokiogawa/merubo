import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merubo/widgets/progress_bar.dart';
import 'package:merubo/widgets/progress_circle.dart';

class ProgressCreateMessageBord extends ConsumerWidget {
  const ProgressCreateMessageBord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        ProgressCircle(),
        ProgressBar(),
        ProgressCircle(),
        ProgressBar(),
        ProgressCircle(),
        ProgressBar(),
        ProgressCircle(),
      ],
    );
  }
}
