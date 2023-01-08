import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final selectedDateTimeProvider =
    StateProvider.autoDispose<DateTime?>((ref) => null);

class DateForm extends ConsumerWidget {
  final String? label;
  final ValueChanged<DateTime>? onSelected;

  const DateForm({Key? key, this.label, this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDateTime = ref.watch(selectedDateTimeProvider);
    final displayFormat = DateFormat('yyyy年MM月dd日');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        label != null ? Text(label!) : Container(),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            final DateTime? selectedValue = await showDatePicker(
                locale: const Locale("ja"),
                context: context,
                initialDate: selectedDateTime ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime.now());
            if (selectedValue != null) {
              ref
                  .read(selectedDateTimeProvider.notifier)
                  .update((state) => selectedValue);
              if (onSelected != null) {
                onSelected!(selectedValue);
              }
            }
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                border: Border.all(color: Colors.grey)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: selectedDateTime != null
                  ? Text(
                      displayFormat.format(selectedDateTime),
                      style: const TextStyle(color: Colors.black),
                    )
                  : const Text(
                      "yyyy年MM月DD日",
                      style: TextStyle(color: Colors.grey),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
