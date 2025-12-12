import 'package:core/constants/app_strings.dart';
import 'package:core/constants/svg_icons.dart';
import 'package:core/utils/dialog_helper.dart';
import 'package:core/utils/navigation_helper.dart';
import 'package:core/utils/toast_helper.dart';
import 'package:core/utils/validators.dart';
import 'package:data/requests/login_request.dart';
import 'package:employee/core/routing/employee_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/core/nachonal_id_form_field.dart';
import 'package:login/core/password_form_field.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:login/login_feature/logic/cubit.dart';
import 'package:login/login_feature/logic/state.dart';
import 'package:shared_ui/widgets/asset_icon.dart';
import 'package:shared_ui/widgets/custom_button.dart';
import 'package:theme/theming/colors/app_colors.dart';
import 'package:theme/theming/colors/light_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nationalIdIdController = TextEditingController();
  final formKey = GlobalKey<FormState>();
@override
  void dispose() {
    passwordController.dispose();
    nationalIdIdController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: context.responsive.symmetricPadding(
              horizontal: 4.0,
              vertical: 2.0
            ),
            child: Column(
              children: [
                AssetIcon(
                  assetName: SvgIcons.employeeLogo,
                  width: context.responsive.screenWidth * 0.4,
                  height: context.responsive.screenHeight * 0.2,
                ),
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Text(
                    AppStrings.singIn,
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Text(
                    AppStrings.singInHint,
                    style: theme.textTheme.labelLarge,
                  ),
                ),
                BlocListener<LoginCubit, LoginStats>(
                  listener: (context, state) =>
                      _handelLoginState(context, state),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: context.responsive.spacingL),
                      Text(
                        AppStrings.employeeId,
                        style: theme.textTheme.bodySmall,
                      ),
                      NachonalIdFormField(
                        nationalIdIdController: nationalIdIdController,
                        validator: (v)=> Validator.validateNachonalId(v),
                      ),
                      SizedBox(height: context.responsive.spacingL),
                      Text(
                        AppStrings.password,
                        style: theme.textTheme.bodySmall,
                      ),
                      PasswordFormField(
                        passwordController: passwordController,
                        validator: (v)=>Validator.validatePassword(v),
                      ),
                      SizedBox(height: context.responsive.spacingXXL),
                      CustomButton(
                        text: AppStrings.singIn,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<LoginCubit>().login(
                              loginRequest: LoginRequest(
                                nationalId: nationalIdIdController.text,
                                password: passwordController.text,
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(height: context.responsive.spacingM,)
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }


  _handelLoginState(BuildContext context, LoginStats state) {
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
        NavigationHelper.pushNamedAndRemoveUntil(context, EmployeeRoute.root);
      }else if (state.userRole == 'HR'){

      }
      else {
        ToastHelper.error(
          context,
          AppStrings.roleErrorMessage,
        );
      }
    }
  }
}
