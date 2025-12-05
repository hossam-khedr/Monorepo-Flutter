
import 'package:core/utils/responsive_helper.dart';
import 'package:employee/home/widgets/home_app_bar.dart';

import 'package:employee/home/widgets/home_card.dart';
import 'package:employee/home/widgets/quick_procedures.dart';
import 'package:employee/home/widgets/recent_activities.dart';
import 'package:flutter/material.dart';
import 'package:theme/theming/colors/light_colors.dart';

class HomeScreen extends StatelessWidget {
  final void Function()? onProfile;
  final void Function()? onAudience;
  final void Function()? onHolidays;
  final void Function()? onSalary;
  final void Function()? onPassword;

  const HomeScreen({
    super.key,
    this.onProfile,
    this.onAudience,
    this.onHolidays,
    this.onSalary, this.onPassword,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: context.responsive.spacingM,),
          HomeAppBar(),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.83,
            children: [
              HomeCard(
                isButtonShow: true,
                title: 'الحضور',
                subTitle: 'آخر تسجيل: 9:00 ص',
                buttonColor: LightColors.blow,
                iconColor: LightColors.blow,
                icon: Icons.access_time,
                onPressed: onAudience,
                textButton: 'تسجيل الانصراف',
              ),
              HomeCard(
                isButtonShow: true,
                title: 'رصيد الإجازات',
                subTitle: 'متبقي: 15 يوم',
                buttonColor: LightColors.green,
                iconColor: LightColors.green,
                icon: Icons.calendar_month,
                onPressed: onHolidays,
                textButton: 'طلب اجازه',
              ),
              HomeCard(
                isButtonShow: false,
                title: 'الإحصائيات',
                subTitle: 'هذا الشهر: 22 يوم',
                buttonColor: Colors.deepPurple,
                iconColor: Colors.deepPurple,
                icon: Icons.bar_chart,
              ),
            ],
          ),
          SizedBox(height: context.responsive.screenHeight * 0.04),
          RecentActivities(),
          SizedBox(height: context.responsive.screenHeight * 0.04),
          QuickProcedures(
            onProfile: onProfile,
            onHolidays: onHolidays,
            onPassword: onPassword
          ),
        ],
      ),
    );
  }
}
