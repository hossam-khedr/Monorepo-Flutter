import 'package:core/constants/api_constants.dart';
import 'package:core/utils/servises/secure_data_helper.dart';
import 'package:employee/base_cubit/cubit.dart';
import 'package:employee/base_cubit/states.dart';
import 'package:employee/core/routing/employee_route.dart';
import 'package:employee/core/routing/generateor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme/theming/dark.dart';
import 'package:theme/theming/light.dart';

class EmployeeApp extends StatelessWidget {
  const EmployeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Future<String?> initRouteAsync = _checkUserLoggedIn();
    return FutureBuilder<String?>(
      future: initRouteAsync,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final initRoute = asyncSnapshot.data ?? EmployeeRoute.login;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: LightTheme.getLightTheme(),
          //darkTheme: DarkTheme.getDarkTheme(),
          // themeMode: context.read<BaseCubit>().toThemeMode(
          //   state.appThemeMode,
          // ),
          initialRoute: initRoute,

          onGenerateRoute: GenerateRoute.onGenerateRoute,
        );
      },
    );
  }
}

Future<String?> _checkUserLoggedIn() async {
  final storage = SecureDataHelper.getInstant;
  final userToken = await storage.getData(key: ApiConstants.tokenKey);
  if (userToken == null) {
    return EmployeeRoute.login;
  } else {
    return EmployeeRoute.root;
  }
}
