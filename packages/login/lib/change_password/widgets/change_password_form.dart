import 'package:core/constants/app_strings.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:core/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/widgets/custom_button.dart';

import '../../core/password_form_field.dart';

class ChangePasswordForm extends StatelessWidget {
  final TextEditingController oldPass;

  final TextEditingController newPass;

  final TextEditingController confirmPass;

  final void Function()? onPressed;

  const ChangePasswordForm({
    super.key,
    required this.oldPass,
    required this.newPass,
    required this.confirmPass,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: context.responsive.symmetricPadding(horizontal: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.responsive.spacingXXL),
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: Text(
                AppStrings.setNewPassword,
                style: theme.textTheme.headlineSmall,
              ),
            ),
            SizedBox(height: context.responsive.spacingS),
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: Text(
                AppStrings.changePasswordHint,
                style: theme.textTheme.labelLarge,
              ),
            ),
            SizedBox(height: context.responsive.spacingM),
            Text(AppStrings.oldPassword),
            PasswordFormField(
              passwordController: oldPass,
              hintText: AppStrings.inputOldPassword,
            ),
            SizedBox(height: context.responsive.spacingM),
            Text(AppStrings.password),
            PasswordFormField(
              passwordController: newPass,
              hintText: AppStrings.inputPassword,
              validator: (v) => Validator.validatePassword(v),
            ),
            SizedBox(height: context.responsive.spacingM),
            Text(AppStrings.confirmPassword),
            PasswordFormField(
              passwordController: confirmPass,
              hintText: AppStrings.inputConfirmPassword,
              validator: (v) => Validator.validatePasswordConfirmation(
                newPass.text,
                confirmPass.text,
              ),
            ),
            SizedBox(height: context.responsive.spacingXL),
            CustomButton(text: AppStrings.submit, onPressed: onPressed),
            SizedBox(height: context.responsive.spacingM),
          ],
        ),
      ),
    );
  }
}
