import 'package:data/data_soures/remote/login_remote_data_sourse.dart';
import 'package:data/repositories/login/login_repo_impl.dart';
import 'package:employee/core/routing/employee_route.dart';
import 'package:employee/root/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/login_feature/logic/cubit.dart';
import 'package:login/login_feature/login_screen.dart';

import '../../root/root_screen.dart';

class GenerateRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    final _args = settings.arguments;
    switch (settings.name) {
      case EmployeeRoute.login:
        final loginRemoteDataSource = LoginRemoteDataSource();
        final loginRepo = LoginRepoEmpl(
          loginRemoteDataSource: loginRemoteDataSource,
        );
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => LoginCubit(loginRepo: loginRepo),
            child: LoginScreen(toRoute: EmployeeRoute.root),
          ),
        );
      case EmployeeRoute.root:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            child: const RootScreen(),
            create: (_) => RootCubit(),
          ),
        );
    }
    return null;
  }
}
