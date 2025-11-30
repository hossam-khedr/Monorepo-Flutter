import 'package:core/utils/responsive_helper.dart';
import 'package:employee/leaves/widgets/state_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_ui/screens/error_screen.dart';
import 'package:theme/theming/colors/light_colors.dart';

import '../../app/app_icon.dart';
import '../logic/cubit.dart';
import '../logic/stats.dart';

class HandelLeaveBalance extends StatefulWidget {
  const HandelLeaveBalance({super.key});

  @override
  State<HandelLeaveBalance> createState() => _HandelLeaveBalanceState();
}

class _HandelLeaveBalanceState extends State<HandelLeaveBalance> {
  @override
  void initState() {
    super.initState();
    context.read<LeavesCubit>().getLeaveBalance();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeavesCubit, LeavesStats>(
      buildWhen: (previous, current) =>
      previous.balanceStatus != current.balanceStatus,
      builder: (context, state) {
        if (state.isGetBalanceLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state.isGetBalanceSuccess ) {
          return SizedBox(
            height: context.responsive.screenHeight * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StateCard(
                  icon: AppIcons.calendar,
                  leaveCouennt: state.balanceResponse?.annual.toString() ?? '',
                  leaveType: 'إجازة سنوية',
                  iconColor: LightColors.green,
                ),
                StateCard(
                  icon: AppIcons.medicalServices,
                  leaveCouennt: state.balanceResponse?.sick.toString() ?? '',
                  leaveType: 'إجازة مرضية',
                  iconColor: LightColors.blow,
                ),
                StateCard(
                  icon: AppIcons.time,
                  leaveCouennt: state.balanceResponse?.casual.toString() ?? '',
                  leaveType: 'إجازة عارضة',
                  iconColor: LightColors.orange,
                ),
              ],
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
