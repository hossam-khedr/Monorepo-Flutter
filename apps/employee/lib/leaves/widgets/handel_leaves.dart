import 'package:core/utils/navigation_helper.dart';
import 'package:employee/app/di.dart';
import 'package:employee/core/routing/employee_route.dart';
import 'package:employee/leaves/leave_details/leave_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_ui/screens/error_screen.dart';

import '../logic/cubit.dart';
import '../logic/stats.dart';
import 'leave_request_card.dart';

class HandelLeaves extends StatefulWidget {
  const HandelLeaves({super.key});

  @override
  State<HandelLeaves> createState() => _HandelLeavesState();
}

class _HandelLeavesState extends State<HandelLeaves> {
  @override
  void initState() {
    super.initState();
    context.read<LeavesCubit>().getLeaves(page: 1);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeavesCubit, LeavesStats>(
      buildWhen: (previous, current) =>
          previous.leavesStatus != current.leavesStatus,
      builder: (context, state) {
        if (state.isGetLeavesLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state.isGetLeavesSuccess) {
          return Expanded(
            child: ListView.separated(
              itemCount: state.leavesData.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return LeaveRequestCard(
                  dataResponse: state.leavesData[index],
                  onLeaveDetaile: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.transparent,
                      barrierColor: Colors.transparent,
                    builder: (context) => BlocProvider.value(
                        value: getIt<LeavesCubit>(),
                      child: LeaveDetailsScreen(id: state.leavesData[index].id),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
