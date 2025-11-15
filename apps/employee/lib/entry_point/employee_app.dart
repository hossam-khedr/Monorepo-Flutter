import 'package:employee/base_cubit/cubit.dart';
import 'package:employee/base_cubit/states.dart';
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
            darkTheme: DarkTheme.getDarkTheme(),
            themeMode: context.read<BaseCubit>().toThemeMode(
              state.appThemeMode,
            ),
            home: RootScreen(),
          );
        },
      ),
    );
  }
}

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<BaseCubit, BaseAppStats>(
            builder: (context, state) {
              return IconButton(
                onPressed: () => context.read<BaseCubit>().toggleTheme(),
                tooltip: 'Toggle Theme',
                icon: Icon(
                  state.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<BaseCubit, BaseAppStats>(
      builder: (context, state) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'اختر المظهر',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                SegmentedButton<AppThemeMode>(
                  segments: const [
                    ButtonSegment(
                      value: AppThemeMode.light,
                      label: Text('فاتح'),
                      icon: Icon(Icons.light_mode_outlined),
                    ),
                    ButtonSegment(
                      value: AppThemeMode.system,
                      label: Text('النظام'),
                      icon: Icon(Icons.brightness_auto),
                    ),
                    ButtonSegment(
                      value: AppThemeMode.dark,
                      label: Text('داكن'),
                      icon: Icon(Icons.dark_mode_outlined),
                    ),
                  ],
                  selected: {state.appThemeMode},
                  onSelectionChanged: (Set<AppThemeMode> selected) {
                    context.read<BaseCubit>().changeTheme(selected.first);
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  'الوضع الحالي: ${state.isDarkMode ? "داكن" : "فاتح"}',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
      )

        ],
      ),
    );
  }
}
