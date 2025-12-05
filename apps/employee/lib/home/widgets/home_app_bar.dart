import 'package:core/constants/svg_icons.dart';
import 'package:core/utils/navigation_helper.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:employee/app/app_icon.dart';
import 'package:employee/core/routing/employee_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/widgets/asset_icon.dart';
import 'package:theme/theming/colors/app_colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.responsive.symmetricPadding(horizontal: 3.0),
      color: AppColors.whit,
      height: context.responsive.screenHeight * 0.12,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(radius: 25, child: Icon(AppIcons.person)),
          SizedBox(width: context.responsive.spacingS),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hossam Khedr',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                'Mid Flutter Developer',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: AppColors.buttonBackground,
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            spacing: context.responsive.spacingS,
            children: [
              AppBarIcon(
                assetName: SvgIcons.chats,
                onTap: () =>
                    NavigationHelper.pushNamed(context, EmployeeRoute.chat),
              ),
              AppBarIcon(assetName: SvgIcons.notificatios, onTap: () =>
                  NavigationHelper.pushNamed(context, EmployeeRoute.notification),),
            ],
          ),
        ],
      ),
    );
  }
}

class AppBarIcon extends StatelessWidget {
  final String assetName;
  final VoidCallback onTap;

  const AppBarIcon({super.key, required this.assetName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: context.responsive.symmetricPadding(
          vertical: 2.0,
          horizontal: 2.0,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.backgroundColor,
        ),
        child: AssetIcon(assetName: assetName),
      ),
    );
  }
}
