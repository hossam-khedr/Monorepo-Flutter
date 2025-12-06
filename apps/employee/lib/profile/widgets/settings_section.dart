import 'package:core/constants/app_strings.dart';
import 'package:core/constants/svg_icons.dart';
import 'package:core/utils/dialog_helper.dart';
import 'package:core/utils/navigation_helper.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:employee/core/routing/employee_route.dart';
import 'package:employee/profile/widgets/profile_sections.dart';
import 'package:employee/profile/widgets/section_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/widgets/asset_icon.dart';
import 'package:shared_ui/widgets/custom_button.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileSections(
      sectionName: AppStrings.settings,
      sectionChild: Column(
        spacing: context.responsive.spacingM,
        children: [
          SectionItem(
            icon: SvgIcons.settings,
            title: AppStrings.changePassword,
            onTap: () => NavigationHelper.pushNamed(
              context,
              EmployeeRoute.changePassword,
            ),
          ),
          SectionItem(icon: SvgIcons.scroll, title: AppStrings.versioning),
          SectionItem(icon: SvgIcons.sms, title: AppStrings.faqAndHelp),
          SectionItem(
            icon: SvgIcons.logout,
            title: AppStrings.logout,
            onTap: () {
              DialogHelper.showAdaptiveDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(AppStrings.logout),
                    content: const Text(AppStrings.sureLogoutMessage),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          AppStrings.cancel,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Perform logout
                          Navigator.pop(context);
                        },
                        child: Text(
                          AppStrings.logout,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(color: Colors.red),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
