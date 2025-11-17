import 'package:employee/app/app_strings.dart';
import 'package:employee/app/responsive_helper.dart';
import 'package:employee/audience/audience_screen.dart';
import 'package:employee/chats/chats_screen.dart';
import 'package:employee/holidays/holidays_screen.dart';
import 'package:employee/home/home_screen.dart';
import 'package:employee/profile/profile_screen.dart';
import 'package:employee/salary/salary_screen.dart';
import 'package:employee/widgets/build_navigator.dart';
import 'package:employee/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int currentIndex = 0;

  final List<GlobalKey<NavigatorState>> navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  void _handleBackPressed() {
    final navigator = navigatorKeys[currentIndex].currentState;

    if (navigator != null && navigator.canPop()) {
      navigator.pop();
    } else if (currentIndex != 0) {
      setState(() {
        currentIndex = 0;
      });
    }
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return AppStrings.home;
      case 1:
        return AppStrings.audience;
      case 2:
        return AppStrings.holidays;
      case 3:
        return AppStrings.salary;
      case 4:
        return AppStrings.chats;
      case 5:
        return AppStrings.profile;
      default:
        return '';
    }
  }

  bool _shouldShowAction() {
    return currentIndex == 0 || currentIndex == 2 || currentIndex == 5;
  }

  Widget? _getActionWidget() {
    switch (currentIndex) {
      case 0:
        return IconButton(icon: Icon(Icons.notifications), onPressed: () {});

      case 2:
        return IconButton(icon: Icon(Icons.add), onPressed: () {});
      case 5:
        return IconButton(icon: Icon(Icons.edit), onPressed: () {});
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _handleBackPressed();
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: CustomAppBar(
            onBackPressed: _handleBackPressed,
            showAction: _shouldShowAction(),
            title: _getTitle(currentIndex),
            action: _getActionWidget(),
          ),
          body: Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: context.responsive.screenWidth *0.03,
              vertical: context.responsive.screenHeight *0.01,
            ),
            child: IndexedStack(
              index: currentIndex,
              children: [
                BuildNavigator(
                  index: 0,
                  navigatorKeys: navigatorKeys,
                  child: HomeScreen(),
                ),
                BuildNavigator(
                  index: 1,
                  navigatorKeys: navigatorKeys,
                  child: AudienceScreen(),
                ),
                BuildNavigator(
                  index: 2,
                  navigatorKeys: navigatorKeys,
                  child: HolidaysScreen(),
                ),
                BuildNavigator(
                  index: 3,
                  navigatorKeys: navigatorKeys,
                  child: SalaryScreen(),
                ),
                BuildNavigator(
                  index: 4,
                  navigatorKeys: navigatorKeys,
                  child: ChatsScreen(),
                ),
                BuildNavigator(
                  index: 5,
                  navigatorKeys: navigatorKeys,
                  child: ProfileScreen(),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: AppStrings.home,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.access_time),
                label: AppStrings.audience,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: AppStrings.holidays,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.monetization_on_outlined),
                label: AppStrings.salary,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.wechat),
                label: AppStrings.chats,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: AppStrings.profile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


