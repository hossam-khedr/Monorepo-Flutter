import 'package:core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:theme/theming/colors/app_colors.dart';

class ProfileSections extends StatelessWidget {
  final String sectionName;
  final Widget sectionChild;

  const ProfileSections({
    super.key,
    required this.sectionName,
    required this.sectionChild,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.responsive.symmetricPadding(
        horizontal: 4.0
      ),
      child: Column(
        spacing: context.responsive.spacingS,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(sectionName),
          Container(
            padding: context.responsive.symmetricPadding(
              horizontal: 3.0,
              vertical: 3.0,
            ),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: sectionChild,
          ),
        ],
      ),
    );
  }
}
