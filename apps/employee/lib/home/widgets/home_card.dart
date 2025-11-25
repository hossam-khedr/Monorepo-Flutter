import 'package:core/utils/responsive_helper.dart';
import 'package:employee/home/widgets/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/widgets/custom_button.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String? textButton;
  final Color buttonColor;
  final Color iconColor;
  final IconData icon;
  final VoidCallback? onPressed;
  final bool isButtonShow;

  const HomeCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.buttonColor,
    required this.iconColor,
    required this.icon,
    this.onPressed,
    this.textButton,
    this.isButtonShow = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: context.responsive.screenHeight * 0.01,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: iconColor.withAlpha(40),
              child: Icon(icon, color: iconColor),
            ),
            Text(title, style: theme.textTheme.titleMedium),
            Text(subTitle, style: theme.textTheme.labelSmall),
            isButtonShow
                ? CustomButton(text: title,buttonColor: buttonColor,onPressed: onPressed,)
                : CustomSlider(value: 50),
          ],
        ),
      ),
    );
  }
}
