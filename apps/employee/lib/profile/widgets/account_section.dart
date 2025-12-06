import 'package:core/constants/app_strings.dart';
import 'package:core/constants/svg_icons.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:employee/profile/widgets/profile_sections.dart';
import 'package:employee/profile/widgets/section_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/widgets/asset_icon.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileSections(
      sectionName: AppStrings.account,
      sectionChild: Column(
        spacing: context.responsive.spacingM,
        children: [
          SectionItem(icon: SvgIcons.user, title: AppStrings.personalData),
          SectionItem(icon: SvgIcons.folder, title: AppStrings.officeAssets),
          SectionItem(icon: SvgIcons.money, title: AppStrings.payrollTax),
        ],
      ),
    );
  }
}
