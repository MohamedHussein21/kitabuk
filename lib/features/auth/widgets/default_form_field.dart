import 'package:flutter/material.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/core/utils/mediaQuary.dart';

class DefaultTextForm extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType type;
  final ValueChanged? onSubmit;
  final ValueChanged? onChange;
  final GestureTapCallback? onTap;
  bool isPassword;
  final String? Function(String? val)? validate;
  final String label;
  final TextStyle? labelStyle;
  final IconData prefix;
  final IconData? suffix;
  final VoidCallback? suffixPressed;
  bool isClickable = true;

  DefaultTextForm({
    Key? key,
    this.controller,
    this.isPassword = false,
    required this.type,
    this.onSubmit,
    this.onChange,
    this.onTap,
    required this.validate,
    required this.label,
    this.labelStyle,
    required this.prefix,
    this.suffix,
    this.suffixPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.heigh * 0.07,
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        onTap: onTap,
        validator: validate,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: labelStyle,
            prefixIcon: Icon(
              prefix,
            ),
            suffixIcon: suffix != null
                ? IconButton(
                    onPressed: suffixPressed,
                    icon: Icon(
                      suffix,
                    ),
                  )
                : null,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.defaultColor),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.defaultColor),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
