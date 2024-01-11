import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_constants.dart';
import 'custom_text.dart';

class CustomLabelInputText extends StatelessWidget {
  const CustomLabelInputText({
    Key? key,
    required this.label,
    required this.controller,
    this.placeholder,
    this.maxLength,
    required this.keyboardType,
    required this.inputAction,
    this.validate,
    this.enabled,
    this.obscureText = false,
    this.readOnly = false,
    this.labelColor,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.sentences,
    this.suffixIcon,
    this.onKeyUp,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  final String? placeholder;
  final int? maxLength;
  final TextInputType keyboardType;
  final TextInputAction inputAction;
  final FormFieldValidator<String>? validate;
  final bool? enabled;
  final bool obscureText;
  final bool readOnly;
  final Color? labelColor;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final Widget? suffixIcon;
  final Function(String)? onKeyUp;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomNunitoText(
          text: label,
          textColor: labelColor ?? Colors.black,
          textSize: 14,
          fontWeight: FontWeight.w400,
        ),
        k10VerticalSpacing,
        Container(
          margin: const EdgeInsets.all(5),
          height: 50,
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(3)),
          ),
          child: TextFormField(
            onChanged: onKeyUp,
            // onEditingComplete: onCompleteEdit,
            controller: controller,
            validator: validate,
            textInputAction: inputAction,
            keyboardType: keyboardType,
            cursorColor: Colors.black,
            maxLength: maxLength,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 1.0,
                horizontal: 10.0,
              ),
              hintText: placeholder,
              hintStyle: const TextStyle(
                fontSize: 14
              ),
              border: InputBorder.none,
              suffixIcon: suffixIcon,
            ),
            readOnly: readOnly,
            enabled: enabled,
            inputFormatters: inputFormatters,
            textCapitalization: textCapitalization,
            obscureText: obscureText,
          ),
        ),
      ],
    );
  }
}
