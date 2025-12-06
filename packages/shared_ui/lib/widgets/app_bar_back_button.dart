import 'package:core/constants/svg_icons.dart';
import 'package:core/utils/navigation_helper.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/widgets/asset_icon.dart';
import 'package:theme/theming/colors/app_colors.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>NavigationHelper.pop(context),
      child: Padding(
        padding: context.responsive.symmetricPadding(
          horizontal: 1.3,
          vertical: 1.3
        ),
        child: Container(
          padding: context.responsive.symmetricPadding(
            horizontal: 1.0,
            vertical: 1.0
          ),
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            shape: BoxShape.circle,
          ),
          child: AssetIcon(assetName: SvgIcons.arrowLeft),
        ),
      ),
    );
  }
}
