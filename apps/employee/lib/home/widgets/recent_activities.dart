import 'package:employee/app/app_icon.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:theme/theming/colors/light_colors.dart';

class RecentActivities extends StatelessWidget {
  const RecentActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.responsive.screenHeight * 0.01),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * 0.05,
              vertical: context.screenHeight * 0.005,
            ),
            child: Text(
              'الأنشطة الأخيرة',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Divider(),
          ActivitiesRow(
            icon: AppIcons.check,
            iconColor: LightColors.green,
            title: 'تم قبول طلب الإجازة',
            subTitle: 'منذ ساعتين',
            avatarColor: LightColors.green,
          ),
          SizedBox(height: context.responsive.screenHeight * 0.02),
          ActivitiesRow(
            icon: AppIcons.time,
            iconColor: LightColors.blow,
            title: 'تسجيل حضور',
            subTitle: 'اليوم 9:00 ص',
            avatarColor: LightColors.blow,
          ),
          SizedBox(height: context.responsive.screenHeight * 0.02),
          ActivitiesRow(
            icon: AppIcons.monetization,
            iconColor: LightColors.orange,
            title: 'تم إيداع الراتب',
            subTitle: 'أمس',
            avatarColor: LightColors.orange,
          ),
        ],
      ),
    );
  }
}

class ActivitiesRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subTitle;
  final Color avatarColor;

  const ActivitiesRow({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subTitle,
    required this.avatarColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.05,
        vertical: context.screenHeight * 0.005,
      ),
      child: Row(
        spacing: context.responsive.screenWidth * 0.02,
        children: [
          CircleAvatar(
            backgroundColor: avatarColor.withAlpha(40),
            child: Icon(icon, color: iconColor),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: theme.textTheme.bodyMedium),
              Text(subTitle, style: theme.textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}
