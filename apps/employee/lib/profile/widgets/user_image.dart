import 'package:core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:theme/theming/colors/app_colors.dart';

import '../../app/app_icon.dart';

class UserImage extends StatelessWidget {
  const UserImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top:
      context.responsive.screenHeight * -0.06,
      left:0,
      right: 0,
      child: Column(
        children: [
          Container(
            width: context.responsive.screenWidth * 0.31,
            height: context.responsive.screenHeight * 0.13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: BoxBorder.all(color: AppColors.whit, width: 2),
            ),
            child: Icon(AppIcons.person, size: context.responsive.spacingXXL),
          ),
          SizedBox(
            height: context.responsive.spacingS,
          ),
          Text('Hossam Khedr', style: Theme.of(context).textTheme.titleSmall),
          Text(
            'Mid Flutter Developer',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: AppColors.buttonBackground,
            ),
          ),
        ],
      ),
    );
  }
}
