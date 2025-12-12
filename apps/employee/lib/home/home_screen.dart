
import 'package:core/utils/responsive_helper.dart';
import 'package:employee/home/widgets/home_app_bar.dart';

import 'package:employee/home/widgets/home_card.dart';
import 'package:employee/home/widgets/quick_procedures.dart';
import 'package:employee/home/widgets/recent_activities.dart';
import 'package:flutter/material.dart';
import 'package:theme/theming/colors/light_colors.dart';

class HomeScreen extends StatelessWidget {


  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: context.responsive.spacingM,),
          HomeAppBar(),

        ],
      ),
    );
  }
}
