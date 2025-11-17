import 'package:employee/app/app_strings.dart';
import 'package:employee/app/responsive_helper.dart';
import 'package:employee/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme/theming/colors/light_colors.dart';

import '../base_cubit/cubit.dart';
import '../base_cubit/states.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: ListView(
        children: [
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.responsive.screenWidth * 0.08,
                vertical: context.responsive.screenHeight * 0.03,
              ),
              child: Column(
                spacing: context.responsive.screenHeight * 0.01,
                children: [
                  CircleAvatar(
                    backgroundColor: LightColors.blow,
                    radius: 40,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  Text('أحمد محمد العلي', style: theme.textTheme.titleLarge),
                  Text('مطور برمجيات', style: theme.textTheme.bodyMedium),
                  Row(
                    spacing: context.responsive.screenWidth * 0.04,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'تعديل الملف',
                            style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: LightColors.read,
                          ),
                          onPressed: () {},
                          child: Text(
                            'تغير كلمة السر',
                            style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
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
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.responsive.screenWidth * 0.03,
                vertical: context.responsive.screenHeight * 0.01,
              ),
              child: Column(
                spacing: context.responsive.screenHeight * 0.02,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('المعلومات الشخصية', style: theme.textTheme.titleLarge),
                  RowInformetion(
                    hint: 'البريد الإلكتروني',
                    data: 'ahmed.ali@company.com',
                  ),
                  RowInformetion(hint: 'رقم الهاتف', data: '+966 50 123 4567'),
                  RowInformetion(hint: 'تاريخ الميلاد', data: '15 يناير 1990'),
                  RowInformetion(hint: 'الجنسية', data: 'سعودي'),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.responsive.screenWidth * 0.03,
                vertical: context.responsive.screenHeight * 0.01,
              ),
              child: Column(
                spacing: context.responsive.screenHeight * 0.02,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('معلومات العمل', style: theme.textTheme.titleLarge),
                  RowInformetion(hint: 'رقم الموظف', data: 'EMP-2024-001'),
                  RowInformetion(hint: 'القسم', data: 'تقنية المعلومات'),
                  RowInformetion(hint: 'المنصب', data: 'مطور برمجيات أول'),
                  RowInformetion(hint: 'تاريخ التوظيف', data: '1 يناير 2022'),
                  RowInformetion(hint: 'المدير المباشر', data: 'سارة أحمد'),
                ],
              ),
            ),
          ),
          SizedBox(height: context.responsive.screenHeight * 0.02),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: LightColors.read),
            onPressed: () {},
            child: Row(
              spacing: context.responsive.screenWidth * 0.02,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.logout, size: 20,color: Colors.white,),
                Text('تسجيل الخروج', style: theme.textTheme.bodyLarge!.copyWith(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RowInformetion extends StatelessWidget {
  final String hint;
  final String data;

  const RowInformetion({super.key, required this.hint, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          hint,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
        ),
        Text(data, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
