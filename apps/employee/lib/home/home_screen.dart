import 'package:employee/app/responsive_helper.dart';
import 'package:employee/home/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:theme/theming/colors/light_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.responsive.screenWidth * 0.01,
          vertical: context.responsive.screenHeight * 0.01,
        ),
        child: Column(
          children: [
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
                  onPressed: (){},
                  textButton: 'تسجيل الانصراف',
                ),
                HomeCard(
                  isButtonShow: true,
                  title: 'رصيد الإجازات',
                  subTitle: 'متبقي: 15 يوم',
                  buttonColor: LightColors.green,
                  iconColor: LightColors.green,
                  icon: Icons.calendar_month,
                  onPressed: (){},
                  textButton: 'طلب اجازه',
                ),
                HomeCard(
                  isButtonShow: true,
                  title: 'الراتب',
                  subTitle: 'هذا الشهر',
                  buttonColor: LightColors.orange,
                  iconColor: LightColors.orange,
                  icon: Icons.monetization_on_outlined,
                  onPressed: (){},
                  textButton: 'عرض التفاصيل',
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

          ],
        ),
      ),
    );
  }
}



