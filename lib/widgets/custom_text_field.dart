import 'package:elegant_shop_app/core/utils/form_validators.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.textStyle,
    required this.cursorColor,
    required this.label,
    required this.labelStyle,
    required this.filled,
    required this.fillColor,
    required this.focusedBorderColor,
    required this.enabledBorderColor,
    required this.suffixIcon,
    this.isEmail,
    this.isUserName,
    this.onChanged, this.borderRadius,
  });
  final TextStyle textStyle;
  final Color cursorColor;
  final String label;
  final TextStyle labelStyle;
  final bool filled;
  final Color fillColor;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final IconData? suffixIcon;
  final bool? isEmail;
  final bool? isUserName;
  final void Function(String)? onChanged;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value) {
        if (isEmail ?? false) {
          return FormValidators().emailValidator(value);
        } else if (isUserName ?? false) {
          return FormValidators().userNameValidator(value);
        } else {
          return null;
        }
      },
      cursorColor: cursorColor,
      style: textStyle,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(32, 16, 8, 16),
        label: Text(label),
        labelStyle: labelStyle,
        filled: filled,
        fillColor: fillColor,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: enabledBorderColor, width: 0.4),
            borderRadius:  BorderRadius.all(Radius.circular(borderRadius??16))),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusedBorderColor, width: 0.5),
            borderRadius:  BorderRadius.all(Radius.circular(borderRadius??16))),
        errorBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius??16))),
        focusedErrorBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius??16))),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(
            suffixIcon,
            color: Colors.black.withOpacity(.55),
          ),
        ),
      ),
    );
  }
}
