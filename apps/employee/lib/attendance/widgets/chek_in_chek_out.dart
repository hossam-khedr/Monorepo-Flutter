import 'package:core/utils/date_formetter.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:core/utils/servises/location_service.dart';
import 'package:core/utils/toast_helper.dart';
import 'package:data/requests/location_request.dart';
import 'package:employee/app/app_icon.dart';
import 'package:employee/attendance/logic/cubit.dart';
import 'package:employee/attendance/logic/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_ui/widgets/custom_button.dart';
import 'package:theme/theming/colors/light_colors.dart';

class CheckInCheckOut extends StatefulWidget {
  const CheckInCheckOut({super.key});

  @override
  State<CheckInCheckOut> createState() => _CheckInCheckOutState();
}

class _CheckInCheckOutState extends State<CheckInCheckOut> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<AttendanceCubit, AttendanceStats>(
      listener: (context, stat) {
        if (stat.isCheckInCheckOutError) {
          ToastHelper.error(context, stat.errorMessage);
        }
        if (stat.isGettingLocation) {
          ToastHelper.error(context, stat.errorMessage);
        }
        if (stat.isCheckInCheckOutSuccess) {
          ToastHelper.success(context, 'تم التسجيل بنجاح');
          context.read<AttendanceCubit>().getTodayAttendance();
          context.read<AttendanceCubit>().getAttendanceStats();
        }
      },
      builder: (context, stat) {
        final hasCheckedIn = stat.data?.hasCheckedIn ?? false;
        final hasCheckedOut = stat.data?.hasCheckedOut ?? false;
        final isLoading = stat.isCheckInCheckOutLoading;

        final shouldCheckIn = !hasCheckedIn;
        final shouldCheckOut = hasCheckedIn && !hasCheckedOut;
        final isDone = hasCheckedIn && hasCheckedOut;
        final date = stat.data?.attendance?.date ??DateTime.now();

        return Card(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: context.responsive.screenHeight * 0.03,
              horizontal: context.responsive.screenWidth * 0.03,
            ),
            child: Column(
              spacing: context.responsive.screenHeight * 0.01,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: LightColors.blow.withAlpha(50),
                  child: Icon(AppIcons.time, color: LightColors.blow),
                ),
                Text(
                  shouldCheckIn
                      ? 'تسجيل الحضور'
                      : shouldCheckOut
                      ? 'تسجيل انصراف'
                      : 'تم التسجيل',
                  style: theme.textTheme.titleLarge,
                ),
                Text(
                  DateFormatHelper.formatDate(date, 'h:mm a', locale: 'ar'),
                  style: theme.textTheme.titleSmall,
                ),
                if (isDone)
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: LightColors.green.withAlpha(50),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle, color: LightColors.green),
                        SizedBox(width: 8),
                        Text(
                          'تم تسجيل الحضور والانصراف',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: LightColors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                else if (isLoading)
                  Center(child: CircularProgressIndicator())
                else
                  CustomButton(
                    text: shouldCheckIn ? 'تسجيل الحضور' : 'تسجيل انصراف',
                    buttonColor: shouldCheckIn
                        ? LightColors.green
                        : LightColors.read,
                    onPressed: () {
                      if (shouldCheckIn) {
                        context.read<AttendanceCubit>().checkIn(
                          context: context,
                        );
                      } else if (shouldCheckOut) {
                        context.read<AttendanceCubit>().checkOut(
                          context: context,
                        );
                      }
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
