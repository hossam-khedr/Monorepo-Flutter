import 'package:core/utils/responsive_helper.dart';

import 'package:employee/profile/widgets/account_section.dart';
import 'package:employee/profile/widgets/contact_section.dart';

import 'package:employee/profile/widgets/profile_app_bar.dart';
import 'package:employee/profile/widgets/settings_section.dart';

import 'package:employee/profile/widgets/user_image.dart';

import 'package:flutter/material.dart';

import 'package:theme/theming/colors/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.buttonBackground,
        width: context.responsive.screenWidth,
        height: context.responsive.screenHeight,
        child: Column(
          children: [
            const ProfileAppBar(),
            Expanded(
              child: Container(
                width: context.responsive.screenWidth,
                height: context.responsive.screenHeight,
                decoration: BoxDecoration(
                  color: AppColors.whit,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Positioned.fill(
                      top: context.responsive.screenHeight * 0.1,
                      bottom: context.responsive.screenHeight * 0.02,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          ContactSection(),
                          SizedBox(height: context.responsive.spacingS),
                          AccountSection(),
                          SizedBox(height: context.responsive.spacingS),
                          SettingsSection(),
                        ],
                      ),
                    ),
                    const UserImage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
