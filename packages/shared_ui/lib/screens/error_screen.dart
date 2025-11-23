import 'package:core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/widgets/custom_button.dart';
import 'package:theme/theming/colors/light_colors.dart';

class ErrorScreen extends StatelessWidget {
  final String error;
  final Function()? onPressed;

  const ErrorScreen({super.key, required this.error, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: context.responsive.screenHeight * 0.03,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: LightColors.read.withAlpha(50),
          child: Icon(
            Icons.error_outline_outlined,
            color: LightColors.read,
            size: 40,
          ),
        ),
        Text(error),
        CustomButton(
          text: 'اعد المحاوله',
          width: context.responsive.screenWidth * 0.6,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
