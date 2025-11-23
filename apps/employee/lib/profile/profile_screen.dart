import 'package:core/utils/navigation_helper.dart';
import 'package:employee/app/di.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:employee/core/routing/employee_route.dart';
import 'package:employee/profile/logic/cubit.dart';
import 'package:employee/profile/logic/stats.dart';
import 'package:employee/profile/widgets/handel_theme.dart';
import 'package:employee/profile/widgets/personal_informition.dart';
import 'package:employee/profile/widgets/updeat_profile.dart';
import 'package:employee/profile/widgets/work_informetion.dart';
import 'package:shared_ui/screens/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_ui/widgets/custom_button.dart';
import 'package:theme/theming/colors/light_colors.dart';

class ProfileScreen extends StatelessWidget {
  final void Function()? onPassword;
  final void Function()? onUpdate;
  final void Function()? onLogout;

  const ProfileScreen({super.key, this.onPassword, this.onUpdate, this.onLogout});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
        getIt<ProfileCubit>()
          ..getUserProfile(),
        child: BlocBuilder<ProfileCubit, ProfileStats>(
          builder: (context, state) {
            if (state.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state.isError) {
              return Center(
                child: ErrorScreen(
                  error: state.errorMessage,
                  onPressed: () =>
                      context.read<ProfileCubit>().getUserProfile(),
                ),
              );
            }
            if (state.isSuccess) {
              return ListView(
                children: [
                  UpdateProfile(
                    stats: state, onPassword: onPassword, onUpdate: onUpdate,),
                  const HandelTheme(),
                  PersonalInformition(userData: state.response!.userData),
                  WorkInformition(userData: state.response!.userData),
                  SizedBox(height: context.responsive.screenHeight * 0.02),
                  CustomButton(text: 'تسجيل الخروج',
                    isIconShow: true,
                    onPressed: onLogout,
                    buttonColor:LightColors.read ,
                    icon: Icon(Icons.logout, size: 20, color: Colors.white),)

                ],
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
