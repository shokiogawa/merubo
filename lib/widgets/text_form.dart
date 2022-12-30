import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? label;
  final String? subLabel;
  final Widget? prefixIcon;
  final String? hintText;
  final int? maxLine;
  final EdgeInsetsGeometry? contentPadding;

  const TextForm(
      {Key? key,
      this.controller,
      this.validator,
      this.label,
      this.subLabel,
      this.prefixIcon,
      this.hintText,
      this.maxLine,
      this.contentPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(label!),
              )
            : Container(),
        subLabel != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  subLabel!,
                  style: const TextStyle(fontSize: 12),
                ),
              )
            : Container(),
        TextFormField(
          textInputAction: TextInputAction.done,
          validator: validator,
          controller: controller,
          maxLines: maxLine ?? 1,
          decoration: InputDecoration(
              prefixIcon: prefixIcon,
              contentPadding: contentPadding ?? const EdgeInsets.only(left: 10),
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 12),
              border: const OutlineInputBorder()),
        ),
      ],
    );
  }
}
