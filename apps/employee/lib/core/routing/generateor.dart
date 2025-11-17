import 'package:employee/core/routing/app_route.dart';
import 'package:employee/root/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../root/root_screen.dart';

class GenerateRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    final _args = settings.arguments;
    switch (settings.name) {
      case AppRoute.root:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                  child:const RootScreen(),
                  create: (_) => RootCubit()),
        );
    }
    return null;
  }
}
