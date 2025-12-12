import 'package:core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/widgets/asset_icon.dart';
import 'package:theme/theming/colors/app_colors.dart';

class BuildAppBar extends StatelessWidget {
  final String assetName;
  final String title;
  final String subTitle;

  const BuildAppBar({
    super.key,
    required this.assetName,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.responsive.symmetricPadding(
        horizontal: 3.0,
        vertical: 2.0,
      ),
      // alignment: Alignment.center,
      width: double.infinity,
      height: context.responsive.screenHeight / 3,
      decoration: BoxDecoration(
        color: AppColors.buttonBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(color: AppColors.whit),
                ),
                Text(
                  subTitle,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: AppColors.whit),
                ),
              ],
            ),
            //AssetIcon(assetName: assetName),
          ],
        ),
      ),
    );
  }
}
