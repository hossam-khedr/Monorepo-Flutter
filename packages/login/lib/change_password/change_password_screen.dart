import 'package:core/constants/app_strings.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:data/requests/change_password_request.dart';
import 'package:login/change_password/widgets/change_password_submeted.dart';
import 'package:shared_ui/widgets/app_bar_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/change_password/logic/cubit.dart';
import 'package:login/change_password/widgets/change_password_form.dart';
import 'package:shared_ui/widgets/custom_button.dart';

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
      appBar: AppBar(
        title: Text(AppStrings.changePassword),
        leading: AppBarBackButton(),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKye,
          child: Column(
            children: [
              ChangePasswordForm(
                oldPass: oldPass,
                newPass: newPass,
                confirmPass: confirmPass,
              ),
              SizedBox(height: context.responsive.screenHeight * 0.35),
              Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                child: Padding(
                  padding: context.responsive.symmetricPadding(
                    horizontal: 4.0,
                    vertical: 1.4,
                  ),
                  child: CustomButton(
                    text: AppStrings.updatePassword,
                    onPressed: () {
                      if (formKye.currentState!.validate()) {
                        final cubit = context.read<PasswordCubit>();
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => ChangePasswordSubmited(
                            onSubmit: () {
                              cubit.changePassword(
                                request: ChangePasswordRequest(
                                  oldPassword: oldPass.text,
                                  newPassword: newPass.text,
                                ),
                              );
                            },
                            cubit: cubit,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
