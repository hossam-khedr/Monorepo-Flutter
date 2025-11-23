import 'package:core/utils/date_formetter.dart';
import 'package:data/responses/user_data.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:employee/profile/widgets/row_informition.dart';
import 'package:flutter/material.dart';

import '../profile_screen.dart';

class PersonalInformition extends StatelessWidget {
  final UserData userData;

  const PersonalInformition({super.key, required this.userData});

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
            Text('المعلومات الشخصية', style: theme.textTheme.titleLarge),
            RowInformetion(hint: 'البريد الإلكتروني', data: userData.email),
            RowInformetion(hint: 'رقم الهاتف', data: userData.phoneNumber),
            RowInformetion(
              hint: 'تاريخ الميلاد',
              data: DateFormatHelper.toArabicDate(userData.dateOfBirth),
            ),
            RowInformetion(hint: 'العنوان', data: userData.address),
          ],
        ),
      ),
    );
  }
}
