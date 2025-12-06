import 'package:employee/chats/chat_rome/chat_rome_screen.dart';
import 'package:employee/chats/chats_screen.dart';
import 'package:employee/core/routing/employee_route.dart';
import 'package:employee/leaves/create_leave/create_leave_screen.dart';
import 'package:employee/leaves/logic/cubit.dart';
import 'package:employee/profile/profile_screen.dart';
import 'package:employee/root/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/change_password/logic/cubit.dart';
import 'package:login/login_feature/logic/cubit.dart';
import 'package:login/login_feature/login_screen.dart';
import 'package:login/change_password/change_password_screen.dart';

import '../../app/di.dart';
import '../../root/root_screen.dart';

class GenerateRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    final _args = settings.arguments;
    switch (settings.name) {
      case EmployeeRoute.login:
        initLoginDependence();
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );

      case EmployeeRoute.changePassword:
        initPasswordDependence();
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<PasswordCubit>(),
            child: ChangePasswordScreen(),
          ),
        );
      case EmployeeRoute.root:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            child: const RootScreen(),
            create: (_) => RootCubit(),
          ),
        );

      case EmployeeRoute.createLeave:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            child: const CreateLeaveScreen(),
            create: (_) => getIt<LeavesCubit>(),
          ),
        );

      case EmployeeRoute.chat:
        return MaterialPageRoute(builder: (_)=> const ChatsScreen());
      case EmployeeRoute.chatRome:
        return MaterialPageRoute(builder: (_)=> const ChatRomeScreen());
      case EmployeeRoute.profile:
        return MaterialPageRoute(builder: (_)=> const ProfileScreen());
    }
    return null;
  }
}
