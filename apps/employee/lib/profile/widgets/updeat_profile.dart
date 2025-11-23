import 'package:core/utils/navigation_helper.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:employee/profile/logic/stats.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/widgets/custom_button.dart';
import 'package:theme/theming/colors/light_colors.dart';

import '../../core/routing/employee_route.dart';

class UpdateProfile extends StatelessWidget {
  final ProfileStats stats;
  final void Function()? onPassword;
  final void Function()? onUpdate;

  const UpdateProfile({
    super.key,
    required this.stats,
    this.onPassword,
    this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.responsive.screenWidth * 0.08,
          vertical: context.responsive.screenHeight * 0.03,
        ),
        child: Column(
          spacing: context.responsive.screenHeight * 0.01,
          children: [
            CircleAvatar(
              backgroundColor: LightColors.blow,
              radius: 40,
              child: Icon(Icons.person, color: Colors.white),
            ),
            Text(
              "${stats.response!.userData.firstName} ${stats.response!.userData.lastName}",
              style: theme.textTheme.titleLarge,
            ),
            Text(
              stats.response!.userData.position,
              style: theme.textTheme.bodyMedium,
            ),
            Row(
              spacing: context.responsive.screenWidth * 0.04,
              children: [
                Expanded(
                  child: CustomButton(text: 'تعديل الملف', onPressed: onUpdate),
                ),
                Expanded(
                  child: CustomButton(
                    text: 'تغير كلمة السر',
                    buttonColor: LightColors.read,
                    onPressed: onPassword,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
