import 'package:core/constants/svg_icons.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/widgets/asset_icon.dart';
import 'package:theme/theming/colors/app_colors.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const CustomNavBar({super.key, required this.currentIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.responsive.screenHeight * 0.074,
      decoration: BoxDecoration(color: AppColors.textPrimary),
      child: Row(
        children: [
          Expanded(
            child: NavBarItem(
              assetName: SvgIcons.home,
              onTap: () => onTap?.call(0),
              isTapSelected: currentIndex == 0,
            ),
          ),
          Expanded(
            child: NavBarItem(
              assetName: SvgIcons.chickIn,
              onTap: () => onTap?.call(1),
              isTapSelected: currentIndex == 1,
            ),
          ),
          Expanded(
            child: NavBarItem(
              assetName: SvgIcons.expence,
              onTap: () => onTap?.call(2),
              isTapSelected: currentIndex == 2,
            ),
          ),
          Expanded(
            child: NavBarItem(
              assetName: SvgIcons.leaves,
              onTap: () => onTap?.call(3),
              isTapSelected: currentIndex == 3,
            ),
          ),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final VoidCallback? onTap;
  final String assetName;
  final bool isTapSelected;

  const NavBarItem({
    super.key,
    required this.assetName,
    this.onTap,
    required this.isTapSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AssetIcon(assetName: assetName),
          isTapSelected
              ? const Divider(thickness: 2, indent: 38.0, endIndent: 38.0)
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
