import 'package:core/utils/cache_helper.dart';
import 'package:core/utils/dialog_helper.dart';
import 'package:core/utils/navigation_helper.dart';
import 'package:core/utils/toast_helper.dart';
import 'package:core/utils/validators.dart';
import 'package:employee/core/routing/employee_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/core/password_form_field.dart';
import 'package:login/core/responsive_helper.dart';
import 'package:login/login_feature/logic/cubit.dart';
import 'package:login/login_feature/logic/state.dart';
import 'package:theme/theming/colors/light_colors.dart';

class LoginScreen extends StatefulWidget {
  final String toRoute;

  const LoginScreen({super.key, required this.toRoute});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.responsive.screenWidth * 0.04,
              vertical: context.responsive.screenHeight * 0.04,
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: context.responsive.screenHeight * 0.090),
                  Icon(Icons.h_mobiledata, size: 100, color: LightColors.blow),
                  Text('تسجيل الدخول', style: theme.textTheme.titleLarge),
                  Text(
                    'مرحباً بك في تطبيق الموارد البشرية',
                    style: theme.textTheme.bodyMedium,
                  ),
                  SizedBox(height: context.responsive.screenHeight * 0.04),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.responsive.screenWidth * 0.06,
                        vertical: context.responsive.screenHeight * 0.04,
                      ),
                      child: BlocListener<LoginCubit, LoginStats>(
                        listener: (context, state) =>
                            _handelLoginState(context, state),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'البريد الإلكتروني',
                              style: theme.textTheme.bodyMedium,
                            ),
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: 'ادخل البريد الالكتروني',
                                prefixIcon: Icon(Icons.email_outlined),
                              ),
                              validator: (value) =>
                                  Validator.validateEmail(value),
                            ),
                            SizedBox(
                              height: context.responsive.screenHeight * 0.03,
                            ),
                            Text(
                              'كلمة المرور',
                              style: theme.textTheme.bodyMedium,
                            ),
                            PasswordFormField(
                              passwordController: passwordController,
                              validator: (value) =>
                                  Validator.validatePassword(value),
                            ),
                            SizedBox(
                              height: context.responsive.screenHeight * 0.06,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<LoginCubit>().login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              child: Row(
                                spacing: context.responsive.screenWidth * 0.01,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.login,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  Text(
                                    'تسجيل الدخول',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: context.responsive.fontSize(18),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: context.responsive.screenHeight * 0.03),
                  Text('© 2024 تطبيق الموارد البشرية. جميع الحقوق محفوظة'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _handelLoginState(BuildContext context,LoginStats state){
    if (state.isLoading) {
      DialogHelper.showLoading(context);
    }
    if (state.isError) {
      NavigationHelper.pop(context);
      ToastHelper.error(context, state.errorMessage);
    }
    if (state.isSuccess) {
      NavigationHelper.pop(context);
      if (state.userRole == 'employee') {
        NavigationHelper.pushNamedAndRemoveUntil(
          context,
          EmployeeRoute.root,
        );
      } else {
        ToastHelper.error(
            context, 'هذا الحساب خاص بالإدارة.\nيرجى استخدام تطبيق HR');
      }
    }
  }
}
