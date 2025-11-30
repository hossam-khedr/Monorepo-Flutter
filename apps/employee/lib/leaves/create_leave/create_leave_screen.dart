import 'package:core/utils/date_formetter.dart';
import 'package:core/utils/dialog_helper.dart';
import 'package:core/utils/navigation_helper.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:core/utils/toast_helper.dart';
import 'package:core/utils/validators.dart';
import 'package:data/requests/leaves_request.dart';
import 'package:employee/leaves/create_leave/widgets/leave_date.dart';
import 'package:employee/leaves/create_leave/widgets/leave_type_widget.dart';
import 'package:employee/leaves/create_leave/widgets/reason_widget.dart';
import 'package:employee/leaves/logic/cubit.dart';
import 'package:employee/leaves/logic/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_ui/widgets/custom_app_bar.dart';
import 'package:shared_ui/widgets/custom_button.dart';
import 'package:theme/theming/colors/light_colors.dart';

class CreateLeaveScreen extends StatefulWidget {
  const CreateLeaveScreen({super.key});

  @override
  State<CreateLeaveScreen> createState() => _CreateLeaveScreenState();
}

class _CreateLeaveScreenState extends State<CreateLeaveScreen> {
  TextEditingController reasonController = TextEditingController();
  final formKye = GlobalKey<FormState>();

  @override
  void dispose() {
    reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar(title: 'طلب إجازة جديدة'),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.responsive.screenWidth * 0.04,
              vertical: context.responsive.screenHeight * 0.02,
            ),
            child: Card(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.responsive.screenWidth * 0.03,
                  vertical: context.responsive.screenHeight * 0.01,
                ),
                child: Form(
                  key: formKye,
                  child: Column(
                    spacing: context.responsive.screenHeight * 0.01,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('نوع الإجازة', style: theme.textTheme.bodyMedium),
                      LeaveTypeWidget(),
                      SizedBox(
                        height: context.responsive.screenHeight * 0.0015,
                      ),
                      Text('تاريخ البداية', style: theme.textTheme.bodyMedium),
                      BlocBuilder<LeavesCubit, LeavesStats>(
                        builder: (context, state) {
                          return LeaveDate(
                            controller: TextEditingController(
                              text: state.startDate != null
                                  ? DateFormatHelper.formatDate(
                                      state.startDate ?? DateTime.now(),
                                      'dd/MM/yyyy',
                                      locale: 'ar',
                                    )
                                  : '',
                            ),
                            onDate: () => context
                                .read<LeavesCubit>()
                                .selectStartDate(context),
                          );
                        },
                      ),
                      SizedBox(
                        height: context.responsive.screenHeight * 0.0015,
                      ),
                      Text('تاريخ النهاية', style: theme.textTheme.bodyMedium),
                      BlocBuilder<LeavesCubit, LeavesStats>(
                        builder: (context, state) {
                          return LeaveDate(
                            controller: TextEditingController(
                              text: state.endDate != null
                                  ? DateFormatHelper.formatDate(
                                      state.endDate ?? DateTime.now(),
                                      'dd/MM/yyyy',
                                      locale: 'ar',
                                    )
                                  : '',
                            ),
                            onDate: () => context
                                .read<LeavesCubit>()
                                .selectEndDate(context),
                          );
                        },
                      ),
                      SizedBox(
                        height: context.responsive.screenHeight * 0.0015,
                      ),
                      Text('سبب الإجازة', style: theme.textTheme.bodyMedium),
                      ReasonWidget(reasonController: reasonController),
                      SizedBox(
                        height: context.responsive.screenHeight * 0.0015,
                      ),
                      BlocBuilder<LeavesCubit, LeavesStats>(
                        builder: (context, state) {
                          return Text(
                            "عدد أيام الإجازة: ${state.difference}",
                            style: theme.textTheme.titleSmall!.copyWith(
                              color: LightColors.green,
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: context.responsive.screenHeight * 0.0015,
                      ),
                      handelCreateLeave(
                        formKye: formKye,
                        reasonController: reasonController,
                        context: context,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget handelCreateLeave({
  required GlobalKey<FormState> formKye,
  required TextEditingController reasonController,
  required BuildContext context,
}) {
  return BlocConsumer<LeavesCubit, LeavesStats>(
    listener: (context, state) {
      if (state.isCreateLoading) {
        DialogHelper.showLoading(context);
      }
      if (state.isCreateError) {
        NavigationHelper.pop(context);
        ToastHelper.error(context, state.errorMessage);
      }
      if (state.isCreateSuccess) {
        NavigationHelper.pop(context);
        ToastHelper.success(context, 'تم انشاء الطلب بنجاح');
      }
    },
    builder: (context, state) {
      final startDate = DateFormatHelper.formatDate(
        state.startDate ?? DateTime.now(),
        'yyyy-MM-dd',
      );
      final endDate = DateFormatHelper.formatDate(
        state.endDate ?? DateTime.now(),
        'yyyy-MM-dd',
      );
      return CustomButton(
        text: 'ارسال الطلب',
        onPressed: () {
          if (formKye.currentState!.validate()) {
            if (!state.endDate!.isAfter(state.startDate!)) {
              ToastHelper.warning(
                context,
                'تاريخ النهايه يجب ان يكون اكبر من تاريخ البدايه',
              );
              return;
            }
            context.read<LeavesCubit>().createLeave(
              request: LeavesRequest(
                type: state.typeValue ?? '',
                startDate: startDate,
                endDate: endDate,
                reason: reasonController.text,
              ),
            );
          }
        },
      );
    },
  );
}
