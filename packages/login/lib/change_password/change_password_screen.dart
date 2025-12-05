import 'package:core/constants/app_strings.dart';
import 'package:core/constants/svg_icons.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:core/utils/validators.dart';
import 'package:data/requests/change_password_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/change_password/logic/cubit.dart';
import 'package:login/change_password/logic/state.dart';
import 'package:login/change_password/widgets/change_password_form.dart';
import 'package:login/change_password/widgets/look_icon.dart';

import 'package:core/utils/dialog_helper.dart';
import 'package:core/utils/navigation_helper.dart';
import 'package:core/utils/toast_helper.dart';
import 'package:shared_ui/widgets/asset_icon.dart';
import 'package:theme/theming/colors/app_colors.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController oldPass = TextEditingController();
  final TextEditingController newPass = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();
  final formKye = GlobalKey<FormState>();

  @override
  void dispose() {
    oldPass.dispose();
    newPass.dispose();
    confirmPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue900,
      body: SingleChildScrollView(
        child: BlocListener<PasswordCubit, PasswordStats>(
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
              ToastHelper.success(context, AppStrings.changePasswordSuccessMessage);
              oldPass.clear();
              newPass.clear();
              confirmPass.clear();
            }
          },
          child: Form(
            key: formKye,
            child: Column(
              children: [

                AssetIcon(
                  assetName: SvgIcons.employeeLogo,
                  width: context.responsive.screenWidth * 0.4,
                  height: context.responsive.screenHeight * 0.3,
                ),
                SizedBox(height: context.responsive.screenHeight * 0.13),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ChangePasswordForm(
                      oldPass: oldPass,
                      newPass: newPass,
                      confirmPass: confirmPass,
                      onPressed: () {
                        if (formKye.currentState!.validate()) {
                          context.read<PasswordCubit>().changePassword(
                            request: ChangePasswordRequest(
                              oldPassword: oldPass.text,
                              newPassword: newPass.text,
                            ),
                          );
                        }
                      },
                    ),
                    const LookIcon(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


