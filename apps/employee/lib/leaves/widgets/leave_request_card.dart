import 'package:core/utils/date_formetter.dart';
import 'package:core/utils/helper_function.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:data/responses/leaves/leaves_data_response.dart';
import 'package:flutter/material.dart';

class LeaveRequestCard extends StatelessWidget {
  final LeavesDataResponse dataResponse;
  final void Function()? onLeaveDetaile;
  const LeaveRequestCard({super.key, required this.dataResponse, this.onLeaveDetaile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: context.responsive.screenWidth * 0.05,
        vertical: context.responsive.screenWidth * 0.02,
      ),
      child: GestureDetector(
        onTap:onLeaveDetaile ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(dataResponse.type, style: Theme.of(context).textTheme.bodyLarge),
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: getLeaveStatusContanerColor(dataResponse.status),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    getLeaveNameType(dataResponse.status),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: getLeaveStatusColor(dataResponse.status),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              DateFormatHelper.toArabicDate(dataResponse.startDate),
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: Colors.grey[400]),
            ),
            SizedBox(height: context.responsive.screenHeight * 0.01),
            Text(
              dataResponse.reason,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}


