import 'package:core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/widgets/asset_icon.dart';
import 'package:theme/theming/colors/app_colors.dart';
import 'package:core/constants/svg_icons.dart';



class LookIcon extends StatelessWidget {
  const LookIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: context.responsive.screenWidth * 0.39,
      top: context.responsive.screenHeight * 0.0-43,
      child: Container(
        height: context.responsive.screenHeight * 0.1,
        width: context.responsive.screenWidth * 0.23,
        decoration: BoxDecoration(
          color: AppColors.buttonBackground,
          borderRadius: BorderRadius.circular(20),
        ),
        child: AssetIcon(assetName:  SvgIcons.changePassword),
      ),
    );
  }
}
