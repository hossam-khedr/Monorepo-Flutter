import 'package:core/utils/date_formetter.dart';
import 'package:data/responses/user_data.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:employee/profile/widgets/row_informition.dart';
import 'package:flutter/material.dart';

class WorkInformition extends StatelessWidget {
  final UserData userData;

  const WorkInformition({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.responsive.screenWidth * 0.03,
          vertical: context.responsive.screenHeight * 0.01,
        ),
        child: Column(
          spacing: context.responsive.screenHeight * 0.02,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('معلومات العمل', style: theme.textTheme.titleLarge),
            RowInformetion(hint: 'رقم الموظف', data: userData.employeeCode),
            RowInformetion(hint: 'القسم', data: userData.department.nameArabic),
            RowInformetion(
              hint: 'المنصب',
              data: userData.department.description,
            ),
            RowInformetion(
              hint: 'تاريخ التوظيف',
              data: DateFormatHelper.toArabicDate(userData.hireDate),
            ),
            RowInformetion(
              hint: 'الراتب',
              data: userData.totalSalary.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
