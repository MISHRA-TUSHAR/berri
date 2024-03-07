import 'package:berri/utils/colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidgets extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final double? borderRadius;
  final int? maxLines;
  final Color? hintTextColor;
  const TextFieldWidgets({
    super.key,
    required this.textController,
    required this.hintText,
    this.borderRadius = 12,
    this.maxLines = 1,
    this.hintTextColor = MyAppColors.textGrey,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      controller: textController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        hintText: hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: hintTextColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: const BorderSide(
            color: MyAppColors.textBlue,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: const BorderSide(
            color: MyAppColors.textGrey,
            width: 1,
          ),
        ),
      ),
    );
  }
}
