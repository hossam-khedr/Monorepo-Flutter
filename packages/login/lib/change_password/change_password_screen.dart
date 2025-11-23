import 'package:core/utils/responsive_helper.dart';
import 'package:core/utils/validators.dart';
import 'package:data/requests/change_password_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/change_password/logic/cubit.dart';
import 'package:login/change_password/logic/state.dart';
import 'package:shared_ui/widgets/custom_app_bar.dart';
import 'package:shared_ui/widgets/password_requirements.dart';
import 'package:shared_ui/widgets/custom_button.dart';
import 'package:core/utils/dialog_helper.dart';
import 'package:core/utils/navigation_helper.dart';
import 'package:core/utils/toast_helper.dart';

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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar(title: 'تغيير كلمة المرور'),
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
                ToastHelper.success(context, 'تم تغير كلمة المرور بنجاح');
                oldPass.clear();
                newPass.clear();
                confirmPass.clear();
              }
            },
            child: Card(
              margin: EdgeInsets.only(
                top: context.responsive.screenHeight * 0.03,
                left: context.responsive.screenWidth * 0.04,
                right: context.responsive.screenWidth * 0.04,
                bottom: context.responsive.screenHeight * 0.15,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.responsive.screenWidth * 0.05,
                  vertical: context.responsive.screenHeight * 0.02,
                ),
                child: Form(
                  key: formKye,
                  child: Column(
                    spacing: context.responsive.screenHeight * 0.01,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('كلمة المرور الحالية'),
                      TextFormField(
                        controller: oldPass,
                        validator: (v) => Validator.validatePassword(v),
                        decoration: InputDecoration(
                          hintText: 'ادخل كلمة المرور الحاليه',
                        ),
                      ),
                      SizedBox(height: context.responsive.screenHeight * 0.01),
                      Text('كلمة المرور الجديدة'),
                      TextFormField(
                        controller: newPass,
                        validator: (v) => Validator.validatePassword(v),
                        decoration: InputDecoration(
                          hintText: 'ادخل كلمة المرور الجديده',
                        ),
                      ),
                      SizedBox(height: context.responsive.screenHeight * 0.01),
                      Text('تأكيد كلمة المرور الجديدة'),
                      TextFormField(
                        controller: confirmPass,
                        validator: (v) =>
                            Validator.validatePasswordConfirmation(
                              newPass.text,
                              confirmPass.text,
                            ),
                        decoration: InputDecoration(
                          hintText: 'اعد ادخال كلمة المرور الجديده',
                        ),
                      ),
                      SizedBox(height: context.responsive.screenHeight * 0.01),
                      PasswordRequirements(
                        title: 'متطلبات كلمة المرور:',
                        requirements: const [
                          'لا تقل عن 8 أحرف',
                          'تحتوي على حرف كبير وصغير',
                          'تحتوي على رقم واحد على الأقل',
                          'تحتوي على رمز خاص واحد على الأقل',
                        ],
                      ),
                      SizedBox(height: context.responsive.screenHeight * 0.01),
                      CustomButton(
                        text: 'حفظ كلمة المرور الجديده',
                        onPressed: () {
                          if(formKye.currentState!.validate()){
                            context.read<PasswordCubit>().changePassword(
                              request: ChangePasswordRequest(
                                oldPassword: oldPass.text,
                                newPassword: newPass.text,
                              ),
                            );
                          }
                        }

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
