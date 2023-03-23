import 'package:flutter/material.dart';
import 'package:mybook/core/utils/mediaQuary.dart';

import '../../../core/utils/colors.dart';

class DefaultButton extends StatelessWidget {
  final String? title;
  final Function()? submit;
  final double width;
  const DefaultButton({Key? key, this.title, this.submit, this.width = 270})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: context.heigh * 0.055,
      child: ElevatedButton(
        onPressed: submit,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )),
            padding: MaterialStateProperty.all(
                const EdgeInsets.fromLTRB(30, 10, 30, 10)),
            backgroundColor: MaterialStateProperty.all(AppColor.defaultColor)),
        child: Text(
          title!,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
