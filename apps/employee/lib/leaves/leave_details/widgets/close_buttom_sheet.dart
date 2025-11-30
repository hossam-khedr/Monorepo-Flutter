import 'package:core/utils/helper_function.dart';
import 'package:core/utils/navigation_helper.dart';
import 'package:employee/app/app_icon.dart';
import 'package:flutter/material.dart';

class CloseButtomSheet extends StatelessWidget {
  final String status;
  const CloseButtomSheet({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>NavigationHelper.pop(context),
      child:  CircleAvatar(
        backgroundColor: getLeaveStatusContanerColor(status),
        child: Icon(AppIcons.close,color: getLeaveStatusColor(status),),
      ),
    );
  }
}
