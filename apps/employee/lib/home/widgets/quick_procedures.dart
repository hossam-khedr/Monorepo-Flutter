
import 'package:core/utils/responsive_helper.dart';

import 'package:flutter/material.dart';

import 'package:theme/theming/colors/light_colors.dart';

import '../../app/app_icon.dart';

class QuickProcedures extends StatelessWidget {
  final void Function()? onProfile;
  final void Function()? onHolidays;
  final void Function()? onPassword;
  const QuickProcedures({super.key, this.onProfile, this.onHolidays, this.onPassword});

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
              'إجراءات سريعة',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Divider(),
          Row(
            children: [
              Expanded(
                child: QuickColumn(
                  icon: AppIcons.calendar,
                  iconColor: LightColors.green,
                  title: 'طلب الإجازة',
                  avatarColor: LightColors.green,
                  onTap: onHolidays,
                ),
              ),
              Expanded(
                child: QuickColumn(
                  icon: AppIcons.person,
                  iconColor: LightColors.blow,
                  title: 'الملف الشخصي',
                  avatarColor: LightColors.blow,
                  onTap: onProfile,
                ),
              ),
              Expanded(
                child: QuickColumn(
                  icon: AppIcons.lock,
                  iconColor: LightColors.read,
                  title: 'كلمة المرور',
                  avatarColor: LightColors.read,
                  onTap: onPassword
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class QuickColumn extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Color avatarColor;
  final void Function()? onTap;
  const QuickColumn({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.avatarColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.responsive.screenHeight * 0.03,
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: avatarColor.withAlpha(40),
              child: Icon(icon, color: iconColor),
            ),
            Text(title, style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
      ),
    );
  }
}
