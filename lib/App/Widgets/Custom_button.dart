import 'package:blogging_app/App/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.text, required this.func, Key? key})
      : super(key: key);

  final String text;
  final Function func;
  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.0.sp,
          )),
      onPressed: () => func(),
      style: ElevatedButton.styleFrom(
        fixedSize:   Size(350, 52),
        primary: AppColor.yellow,
      ),
    );
  }
}
