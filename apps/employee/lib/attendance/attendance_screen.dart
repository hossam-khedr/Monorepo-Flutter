import 'package:core/utils/responsive_helper.dart';
import 'package:employee/app/di.dart';
import 'package:employee/attendance/logic/cubit.dart';
import 'package:employee/attendance/widgets/chek_in_chek_out.dart';
import 'package:employee/attendance/widgets/month_statistics.dart';
import 'package:employee/attendance/widgets/today_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> getIt<AttendanceCubit>(),
      child: Column(
        spacing: context.responsive.screenHeight *0.02,
        children: [
         const CheckInCheckOut(),
         const TodaySummary(),
         const MonthStatistics()

        ],
      ),
    );
  }
}
