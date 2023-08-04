import 'dart:js_interop';

import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final TextEditingController textController;
  final String? label;
  final String? hintText;
  final int? maxLines;
  const CustomTextInput({
    super.key,
    required this.textController,
    this.label,
    this.hintText,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
        label: label.isNull ? null : Text(label!),
      ),
    );
  }
}
