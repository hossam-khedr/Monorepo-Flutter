import 'package:core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:theme/theming/colors/light_colors.dart';

class PasswordRequirements extends StatelessWidget {
  final String title;
  final List<String> requirements;
  const PasswordRequirements({super.key, required this.title, required this.requirements});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.responsive.screenWidth * 0.05,
        vertical: context.responsive.screenHeight * 0.005,
      ),
      decoration: BoxDecoration(
        color: LightColors.orange.withAlpha(50),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color:  LightColors.orange,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            spacing: context.responsive.screenWidth * 0.03,
            children: [
              Icon(
                Icons.info_outline,
                color: LightColors.orange,
                size: 20,
              ),
              Text(title,style: TextStyle(
            fontSize: context.responsive.fontSize(16),
            fontWeight: FontWeight.bold,
            color: Colors.amberAccent,
          ),
            textAlign: TextAlign.center,
          ),

            ],
          ),
           SizedBox(height: context.responsive.screenHeight * 0.01),
          ...requirements.map((requirement)=>
              Padding(
                padding:  EdgeInsets.only(right: context.responsive.screenWidth * 0.08),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:  EdgeInsets.only(top: context.responsive.screenHeight * 0.012),
                      width: context.responsive.screenWidth * 0.02,
                      height: context.responsive.screenHeight * 0.008,
                      decoration: BoxDecoration(
                        color: LightColors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                     SizedBox(width: context.responsive.screenWidth * 0.03),

                    Expanded(
                      child: Text(
                        requirement,
                        style: TextStyle(
                          fontSize: context.responsive.fontSize(14),
                          color: Colors.amberAccent,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
