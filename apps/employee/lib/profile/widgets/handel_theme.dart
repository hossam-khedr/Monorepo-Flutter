import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base_cubit/cubit.dart';
import '../../base_cubit/states.dart';

class HandelTheme extends StatelessWidget {
  const HandelTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium,
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
                      onSelectionChanged:
                          (Set<AppThemeMode> selected) {
                        context.read<BaseCubit>().changeTheme(
                          selected.first,
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
