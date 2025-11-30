import 'package:core/utils/responsive_helper.dart';

import 'package:employee/app/di.dart';
import 'package:employee/leaves/logic/cubit.dart';
import 'package:employee/leaves/logic/stats.dart';

import 'package:employee/leaves/widgets/handel_leave_balance.dart';
import 'package:employee/leaves/widgets/handel_leaves.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_ui/screens/error_screen.dart';

class LeavesScreen extends StatelessWidget {
  const LeavesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LeavesCubit>(),
      child: BlocBuilder<LeavesCubit, LeavesStats>(
        builder: (context, state) {
          if (state.isGetBalanceError || state.isGetLeavesError) {
            return ErrorScreen(
              error: state.errorMessage,
              onPressed: () => context.read<LeavesCubit>().getLeavesData(),
            );
          }
          return Column(
            children: [
              HandelLeaveBalance(),
              SizedBox(height: context.responsive.screenHeight * 0.03),
              Expanded(
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: context.responsive.screenHeight * 0.02,
                          horizontal: context.responsive.screenWidth * 0.05,
                        ),
                        child: Text(
                          'طلبات الإجازات',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      const Divider(),
                      HandelLeaves(),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
