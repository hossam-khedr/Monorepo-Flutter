import 'package:core/utils/dialog_helper.dart';
import 'package:core/utils/navigation_helper.dart';
import 'package:employee/app/app_icon.dart';
import 'package:employee/app/app_strings.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:employee/chats/chats_screen.dart';
import 'package:employee/home/home_screen.dart';
import 'package:employee/leaves/leaves_screen.dart';
import 'package:employee/profile/profile_screen.dart';
import 'package:employee/root/cubit/cubit.dart';
import 'package:employee/root/cubit/state.dart';
import 'package:employee/salary/salary_screen.dart';
import 'package:employee/widgets/build_navigator.dart';
import 'package:employee/widgets/custom_nav_bar.dart';
import 'package:shared_ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../attendance/attendance_screen.dart';
import '../core/routing/employee_route.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, RootStates>(
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
          },
          child: Scaffold(
            body: IndexedStack(
              index: state.ccurrentIndex,
              children: context.read<RootCubit>().screens,
            ),
             bottomNavigationBar: CustomNavBar(
                 currentIndex: state.ccurrentIndex,
               onTap: (index){
                 context.read<RootCubit>().selectedIndex(index);
               },
             )
          ),
        );
      },
    );
  }
}


