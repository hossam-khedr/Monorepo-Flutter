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
    return BlocProvider(
      create: (context) => BaseCubit(),
      child: BlocBuilder<BaseCubit, BaseAppStats>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: LightTheme.getLightTheme(),
            //darkTheme: DarkTheme.getDarkTheme(),
            // themeMode: context.read<BaseCubit>().toThemeMode(
            //   state.appThemeMode,
            // ),
            initialRoute:EmployeeRoute.changePassword,
            //context.read<BaseCubit>().checedEmployeeLogdIin(),

            onGenerateRoute: GenerateRoute.onGenerateRoute,
          );
        },
      ),
    );
  }
}
