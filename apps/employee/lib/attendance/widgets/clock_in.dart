import 'package:core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/widgets/custom_button.dart';
import 'package:theme/theming/colors/app_colors.dart';

class ClockIn extends StatelessWidget {
  const ClockIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.responsive.symmetricPadding(
        horizontal: 1.6,
        vertical: 1.2,
      ),
      height: context.responsive.screenHeight * 0.26,
      decoration: BoxDecoration(
        color: AppColors.whit,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Working Hour',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            'Paid Period 1 Sept 2024 - 30 Sept 2024',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(height: context.responsive.spacingM),
          Row(
            spacing: context.responsive.spacingS,
            children: [
              Expanded(
                child: Container(
                  padding: context.responsive.symmetricPadding(
                    horizontal: 2.0,
                    vertical: 1.5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    spacing: context.responsive.spacingS,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'This Pay Period',
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall,
                      ),
                      Text(
                        '32:00 Hrs',
                        style: Theme.of(
                          context,
                        ).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: context.responsive.symmetricPadding(
                    horizontal: 2.0,
                    vertical: 1.5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    spacing: context.responsive.spacingS,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'This Pay Period',
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall,
                      ),
                      Text(
                        '32:00 Hrs',
                        style: Theme.of(
                          context,
                        ).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: context.responsive.spacingM),
          CustomButton(text: 'Clock In', onPressed: () {}),
        ],
      ),
    );
  }
}
