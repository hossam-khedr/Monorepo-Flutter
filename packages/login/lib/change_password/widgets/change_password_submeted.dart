import 'package:core/constants/app_strings.dart';
import 'package:core/utils/dialog_helper.dart';
import 'package:core/utils/navigation_helper.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:core/utils/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/change_password/logic/cubit.dart';
import 'package:login/change_password/logic/state.dart';
import 'package:login/change_password/widgets/look_icon.dart';
import 'package:shared_ui/widgets/custom_button.dart';
import 'package:theme/theming/app_typo_graphy.dart';
import 'package:theme/theming/colors/app_colors.dart';

class ChangePasswordSubmited extends StatelessWidget {
  final PasswordCubit cubit;
  final void Function()? onSubmit;

  const ChangePasswordSubmited({super.key, this.onSubmit, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocListener<PasswordCubit,PasswordStats>(
        listener: (context, state) {
          if (state.isLoading) {
            DialogHelper.showLoading(context);

          }
          if (state.isError) {
            NavigationHelper.pop(context);
            ToastHelper.error(context, state.errorMessage);

          }
          if (state.isSuccess) {
            NavigationHelper.pop(context);
            ToastHelper.success(
              context,
              AppStrings.changePasswordSuccessMessage,
            );
          }
        },
        child: SizedBox(
          height: context.responsive.screenHeight / 3,
          child: Card(
            margin: EdgeInsets.zero,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                LookIcon(),
                Positioned.fill(
                  top: context.responsive.screenHeight * 0.07,
                  child: Padding(
                    padding: context.responsive.symmetricPadding(horizontal: 5.2),
                    child: Column(
                      spacing: context.responsive.spacingS,
                      children: [
                        Text(
                          AppStrings.updatePassword,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          AppStrings.updatePasswordHintMessage,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        CustomButton(
                          text: AppStrings.yesUpdatePassword,
                          onPressed: onSubmit,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: context.responsive.screenHeight * 0.055,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(color: AppColors.buttonBackground),
                              ),
                            ),
                            onPressed: () => NavigationHelper.pop(context),
                            child: Text(
                              AppStrings.noLetMeCheck,
                              style: AppTypography.button(
                                AppColors.buttonBackground,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
