import 'package:core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:theme/theming/app_typo_graphy.dart';

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
    this.textStyle ,
    this.isIconShow = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?? context.responsive.screenHeight * 0.055,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ?isIconShow == true ? icon : null,
            Text(text, style: textStyle?? AppTypography.button(Colors.white)),

          ],
        ),
      ),
    );
  }
}
