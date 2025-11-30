import 'package:core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';

class StateCard extends StatelessWidget {
  final IconData icon;
  final String leaveCouennt;
  final String leaveType;
  final Color iconColor;

  const StateCard({
    super.key,
    required this.icon,
    required this.leaveCouennt,
    required this.leaveType,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: context.responsive.screenWidth * 0.04,
          vertical: context.responsive.screenHeight * 0.015
        ),
        child: Column(
          spacing: context.responsive.screenHeight * 0.01,
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: iconColor.withAlpha(50),
              child: Icon(icon, color: iconColor,size: 20,),
            ),
            Text(
              leaveCouennt,
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(color: iconColor),
            ),
            Text(leaveType, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
