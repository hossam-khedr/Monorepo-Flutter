import 'package:core/utils/responsive_helper.dart';
import 'package:employee/attendance/logic/cubit.dart';
import 'package:employee/attendance/logic/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme/theming/colors/light_colors.dart';

class MonthStatistics extends StatefulWidget {
  const MonthStatistics({super.key});

  @override
  State<MonthStatistics> createState() => _MonthStatisticsState();
}

class _MonthStatisticsState extends State<MonthStatistics> {
  @override
  void initState() {
    super.initState();
    context.read<AttendanceCubit>().getAttendanceStats();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<AttendanceCubit, AttendanceStats>(
      builder: (context, stat) {
        if (stat.isAttendanceStatsLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (stat.isAttendanceStatsError) {
          return Center(child: Text(stat.errorMessage));
        }
        if (stat.isAttendanceStatsSuccess ||
            stat.isCheckInCheckOutLoading ||
            stat.isCheckInCheckOutError ||
            stat.isCheckInCheckOutSuccess ||
            stat.isGetTodayAttendanceSuccess ||
            stat.isGetTodayAttendanceLoading ||
            stat.isGetTodayAttendanceError) {
          return Card(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.responsive.screenHeight * 0.02,
                horizontal: context.responsive.screenWidth * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: context.responsive.screenHeight * 0.02,
                children: [
                  Text('ملخص اليوم', style: theme.textTheme.titleMedium),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('أيام العمل', style: theme.textTheme.bodyMedium),
                      Text(
                        ' يوم${stat.statsResponse?.totalDays.toString()}',
                        style: theme.textTheme.titleSmall,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('أيام الحضور', style: theme.textTheme.bodyMedium),
                      Text(
                        ' يوم${stat.statsResponse?.presentDays.toString()}',
                        style: theme.textTheme.titleSmall!.copyWith(
                          color: LightColors.green,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('أيام الغياب', style: theme.textTheme.bodyMedium),
                      Text(
                        ' يوم${stat.statsResponse?.absentDays.toString()}',
                        style: theme.textTheme.titleSmall!.copyWith(
                          color: LightColors.read,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
