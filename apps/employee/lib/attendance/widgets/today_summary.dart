import 'package:core/utils/date_formetter.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:employee/attendance/logic/cubit.dart';
import 'package:employee/attendance/logic/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme/theming/colors/light_colors.dart';
import 'package:core/utils/helper_function.dart';

class TodaySummary extends StatefulWidget {
  const TodaySummary({super.key});

  @override
  State<TodaySummary> createState() => _TodaySummaryState();
}

class _TodaySummaryState extends State<TodaySummary> {
  @override
  void initState() {
    super.initState();
    context.read<AttendanceCubit>().getTodayAttendance();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<AttendanceCubit, AttendanceStats>(
      builder: (context, state) {
        final date = state.data?.attendance?.checkIn ?? DateTime.now();
        if (state.isGetTodayAttendanceLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state.isGetTodayAttendanceError) {
          return Center(child: Text(state.errorMessage));
        }
        if (state.isGetTodayAttendanceSuccess ||
            state.isGettingLocation ||
            state.isCheckInCheckOutLoading ||
            state.isCheckInCheckOutError ||
            state.isCheckInCheckOutSuccess ||
            state.isAttendanceStatsSuccess ||
            state.isAttendanceStatsError ||
            state.isAttendanceStatsLoading) {
          return Card(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.responsive.screenHeight * 0.02,
                horizontal: context.responsive.screenWidth * 0.03,
              ),
              child: Column(
                spacing: context.responsive.screenHeight * 0.02,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ملخص اليوم', style: theme.textTheme.titleMedium),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            DateFormatHelper.formatDate(date, 'hh:mm'),
                            style: theme.textTheme.titleLarge!.copyWith(
                              color: LightColors.blow,
                            ),
                          ),
                          Text('وقت الحضور', style: theme.textTheme.bodyMedium),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            roundToMaxDecimalDigit(
                              state.data?.attendance?.workHours ?? 0.0,
                            ).toString(),
                            style: theme.textTheme.titleLarge,
                          ),
                          Text(
                            'ساعات العمل',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}


