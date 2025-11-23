import 'package:core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? buttonColor;
  final String text;
  final Widget? icon;
  final bool? isIconShow;
  final TextStyle? textStyle;
  final void Function()? onPressed;

  const CustomButton({
    super.key,
    this.height ,
    this.width = double.infinity,
    this.buttonColor,
    required this.text,
    this.icon,
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    this.isIconShow = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?? context.responsive.screenHeight * 0.06,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: textStyle),
            ?isIconShow == true ? icon : null,
          ],
        ),
      ),
    );
  }
}
