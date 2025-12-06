import 'package:core/constants/svg_icons.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/widgets/asset_icon.dart';

class SectionItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback? onTap;

  const SectionItem({super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.responsive.spacingXS,
        ),
        child: Row(
          spacing: context.responsive.spacingS,
          children: [
            AssetIcon(assetName: icon),
            Text(title),
            const Spacer(),
            AssetIcon(assetName: SvgIcons.arrowRight),
          ],
        ),
      ),
    );
  }
}