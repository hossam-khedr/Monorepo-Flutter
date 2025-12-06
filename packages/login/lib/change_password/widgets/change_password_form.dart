import 'package:core/constants/app_strings.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:core/utils/validators.dart';
import 'package:flutter/material.dart';

import '../../core/password_form_field.dart';

class ChangePasswordForm extends StatelessWidget {
  final TextEditingController oldPass;

  final TextEditingController newPass;

  final TextEditingController confirmPass;



  const ChangePasswordForm({
    super.key,
    required this.oldPass,
    required this.newPass,
    required this.confirmPass,

  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: context.responsive.symmetricPadding(
          horizontal: 1.2,
          vertical: 1.6
      ),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        elevation: 0,
        child: Padding(
          padding: context.responsive.symmetricPadding(horizontal: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.responsive.spacingM),

                 Text(
                  AppStrings.changePasswordForm,
                  style: theme.textTheme.headlineSmall,
                ),

              SizedBox(height: context.responsive.spacingS),
               Text(
                  AppStrings.changePasswordHint,
                  style: theme.textTheme.labelLarge,
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
              SizedBox(height: context.responsive.spacingM),
            ],
          ),
        ),
      ),
    );
  }
}
