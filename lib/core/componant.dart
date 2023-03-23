import 'package:flutter/material.dart';

Widget defaultTextButton({
  @required VoidCallback? function,
  @required String? text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text!,
        style: const TextStyle(color: Colors.black),
      ),
    );
