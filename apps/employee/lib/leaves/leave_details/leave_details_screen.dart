import 'package:core/utils/date_formetter.dart';
import 'package:core/utils/helper_function.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:employee/app/app_icon.dart';
import 'package:employee/leaves/leave_details/widgets/close_buttom_sheet.dart';
import 'package:employee/leaves/leave_details/widgets/row_item.dart';
import 'package:employee/leaves/logic/cubit.dart';
import 'package:employee/leaves/logic/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_ui/screens/error_screen.dart';
import 'package:theme/theming/colors/light_colors.dart';

class LeaveDetailsScreen extends StatefulWidget {
  final String id;

  const LeaveDetailsScreen({super.key, required this.id});

  @override
  State<LeaveDetailsScreen> createState() => _LeaveDetailsScreenState();
}

class _LeaveDetailsScreenState extends State<LeaveDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LeavesCubit>().getLeavesById(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: context.responsive.symmetricPadding(
            horizontal: 5.0,
            vertical: 3.0,
          ),
          child: BlocBuilder<LeavesCubit, LeavesStats>(
            builder: (contex, state) {
              if (state.isGetLeavesByIDLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.isGetLeavesByIDError) {
                return Center(
                  child: ErrorScreen(
                    error: state.errorMessage,
                    onPressed: () =>
                        contex.read<LeavesCubit>().getLeavesById(id: widget.id),
                  ),
                );
              }
              if (state.isGetLeavesByIDSuccess) {
                return _handelLeaveSuccess(state, contex);
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}

Widget _handelLeaveSuccess(LeavesStats state, BuildContext context) {
  final theme = Theme.of(context);
  return SingleChildScrollView(
    child: Column(
      spacing: context.responsive.spacingS,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: CloseButtomSheet(status: state.leaveByID?.status ?? ''),
        ),
        CircleAvatar(
          radius: 25,
          backgroundColor: getLeaveStatusContanerColor(
            state.leaveByID?.status ?? '',
          ),
          child: Icon(
            AppIcons.calendar,
            color: getLeaveStatusColor(state.leaveByID?.status ?? ''),
          ),
        ),
        Text(state.leaveByID?.type ?? '', style: theme.textTheme.titleMedium),
        Container(
          padding: context.responsive.symmetricPadding(
            vertical: 0.5,
            horizontal: 0.5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: getLeaveStatusContanerColor(state.leaveByID?.status ?? ''),
          ),
          child: Text(
            getLeaveNameType(state.leaveByID?.status ?? ''),
            style: theme.textTheme.bodyMedium,
          ),
        ),
        SizedBox(height: context.responsive.spacingM),
        RowItem(
          hint: ('تاريخ البداية'),
          data: (DateFormatHelper.toArabicDate(
            state.leaveByID?.startDate ?? '',
          )),
        ),
        Divider(),
        RowItem(
          hint: 'تاريخ النهاية',
          data: DateFormatHelper.toArabicDate(state.leaveByID?.endDate ?? ''),
        ),
        Divider(),
        RowItem(
          hint: 'عدد الأيام',
          data: state.leaveByID?.totalDays.toString() ?? '',
        ),
        Divider(),
        RowItem(
          hint: 'تاريخ الطلب',
          data: DateFormatHelper.toArabicDate(state.leaveByID?.createdAt ?? ''),
        ),
        SizedBox(height: context.responsive.spacingM),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: context.responsive.spacingS,
          children: [
            Text('سبب الإجازة'),
            Container(
              padding: context.responsive.symmetricPadding(
                horizontal: 2.0,
                vertical: 2.0,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(state.leaveByID?.reason ?? ''),
            ),
            SizedBox(height: context.responsive.spacingM),
            Text('ملاحظات الموارد البشرية'),
            Container(
              padding: context.responsive.symmetricPadding(
                horizontal: 2.0,
                vertical: 2.0,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(state.leaveByID?.reviewNotes ?? 'لا توجد ملاحاظات'),
            ),
          ],
        ),
      ],
    ),
  );
}
