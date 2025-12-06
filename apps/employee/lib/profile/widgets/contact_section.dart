import 'package:core/constants/app_strings.dart';
import 'package:core/constants/svg_icons.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:employee/profile/widgets/profile_sections.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/widgets/asset_icon.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileSections(
        sectionName: AppStrings.contacts,
        sectionChild: Column(
          spacing: context.responsive.spacingM,
          children: [
            Row(
              spacing: context.responsive.spacingS,
              children: [
                AssetIcon(assetName: SvgIcons.sms),
                Text('hossam@gmail.com')
              ],
            ),
            Row(
              spacing: context.responsive.spacingS,
              children: [
                AssetIcon(assetName: SvgIcons.location),
                Text('Hossam khedr')
              ],
            ),
          ],
        ),
    );
  }
}
