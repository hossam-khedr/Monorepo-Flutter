import 'package:core/constants/svg_icons.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:employee/app/di.dart';
import 'package:employee/attendance/logic/cubit.dart';
import 'package:employee/attendance/widgets/clock_in.dart';

import 'package:employee/widgets/build_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_ui/widgets/custom_button.dart';
import 'package:theme/theming/colors/app_colors.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AttendanceCubit>(),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            BuildAppBar(
              assetName: SvgIcons.logout,
              title: 'Let’s Clock-In!',
              subTitle: 'Don’t miss your clock in schedule',
            ),
            Positioned.fill(
              top: context.responsive.screenHeight * 0.18,
              left: context.responsive.screenWidth * 0.04,
              right: context.responsive.screenWidth * 0.04,
              child: Column(
                spacing: context.responsive.spacingS,
                children: [
                 const ClockIn(),
                  Expanded(
                    child: ListView.separated(
                      itemCount: 7,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: context.responsive.spacingS),
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text('Index $index'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
