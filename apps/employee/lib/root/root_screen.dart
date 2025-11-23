import 'package:core/utils/dialog_helper.dart';
import 'package:core/utils/navigation_helper.dart';
import 'package:employee/app/app_icon.dart';
import 'package:employee/app/app_strings.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:employee/audience/audience_screen.dart';
import 'package:employee/chats/chats_screen.dart';
import 'package:employee/holidays/holidays_screen.dart';
import 'package:employee/home/home_screen.dart';
import 'package:employee/profile/profile_screen.dart';
import 'package:employee/root/cubit/cubit.dart';
import 'package:employee/root/cubit/state.dart';
import 'package:employee/salary/salary_screen.dart';
import 'package:employee/widgets/build_navigator.dart';
import 'package:shared_ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/routing/employee_route.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RootCubit, RootStates>(
      listener: (context, state) {
        if (state.isUserLoggedOut) {
          NavigationHelper.pushNamedAndRemoveUntil(
            context,
            EmployeeRoute.login,
          );
        }
      },
      builder: (context, state) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
            if (state.ccurrentIndex == 0) {
              DialogHelper.warning(
                context,
                message: 'هل تريد الخروج؟',
                onConfirm: () => SystemNavigator.pop(),
                barrierDismissible: true,
                buttonText: 'نعم',
              );
            }
            context.read<RootCubit>().handleBackPressed();
          },
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: CustomAppBar(
                onBackPressed: context.read<RootCubit>().handleBackPressed,
                showAction: context.read<RootCubit>().shouldShowAction(),
                title: context.read<RootCubit>().getTitle(state.ccurrentIndex),
                action: context.read<RootCubit>().getActionWidget(),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.responsive.screenWidth * 0.03,
                  vertical: context.responsive.screenHeight * 0.01,
                ),
                child: IndexedStack(
                  index: state.ccurrentIndex,
                  children: [
                    BuildNavigator(
                      index: 0,
                      navigatorKeys: state.navigatorKeys,
                      child: HomeScreen(
                        onAudience: () =>
                            context.read<RootCubit>().selectedIndex(1),
                        onProfile: () =>
                            context.read<RootCubit>().selectedIndex(5),
                        onHolidays: () =>
                            context.read<RootCubit>().selectedIndex(2),
                        onSalary: () =>
                            context.read<RootCubit>().selectedIndex(3),
                        onPassword: () => NavigationHelper.pushNamed(
                          context,
                          EmployeeRoute.changePassword,
                        ),
                      ),
                    ),
                    BuildNavigator(
                      index: 1,
                      navigatorKeys: state.navigatorKeys,
                      child: AudienceScreen(),
                    ),
                    BuildNavigator(
                      index: 2,
                      navigatorKeys: state.navigatorKeys,
                      child: HolidaysScreen(),
                    ),
                    BuildNavigator(
                      index: 3,
                      navigatorKeys: state.navigatorKeys,
                      child: SalaryScreen(),
                    ),
                    BuildNavigator(
                      index: 4,
                      navigatorKeys: state.navigatorKeys,
                      child: ChatsScreen(),
                    ),
                    BuildNavigator(
                      index: 5,
                      navigatorKeys: state.navigatorKeys,
                      child: ProfileScreen(
                        onUpdate: () {},
                        onPassword: () => NavigationHelper.pushNamed(
                          context,
                          EmployeeRoute.changePassword,
                        ),
                        onLogout: () => context.read<RootCubit>().logout(),
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: state.ccurrentIndex,
                onTap: (index) {
                  context.read<RootCubit>().selectedIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(AppIcons.home),
                    label: AppStrings.home,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(AppIcons.time),
                    label: AppStrings.audience,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(AppIcons.calendar),
                    label: AppStrings.holidays,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(AppIcons.monetization),
                    label: AppStrings.salary,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(AppIcons.chat),
                    label: AppStrings.chats,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(AppIcons.person),
                    label: AppStrings.profile,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
