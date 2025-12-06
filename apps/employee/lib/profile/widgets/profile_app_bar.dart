import 'package:core/constants/svg_icons.dart';
import 'package:core/utils/navigation_helper.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/widgets/asset_icon.dart';
import 'package:theme/theming/colors/app_colors.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.responsive.symmetricPadding(
        horizontal: 4
      ),
      height: context.responsive.screenHeight * 0.18,
      decoration: BoxDecoration(color: AppColors.buttonBackground),
      child: Row(
        spacing: context.responsive.screenWidth / 3.9,
        children: [
          InkWell(
            onTap: ()=>NavigationHelper.pop(context),
            child: Container(
              padding: context.responsive.symmetricPadding(
                  horizontal: 2.0
              ),
              height: context.responsive.screenHeight * 0.07,
              decoration: BoxDecoration(
                color: AppColors.whit,
                shape: BoxShape.circle,
              ),
              child: AssetIcon(assetName: SvgIcons.arrowLeft),
            ),
          ),
          Text(
            'My Profile',
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: AppColors.whit),
          ),
        ],
      ),
    );
  }
}
