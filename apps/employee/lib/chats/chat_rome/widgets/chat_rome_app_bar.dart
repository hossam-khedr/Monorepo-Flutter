import 'package:core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:theme/theming/colors/light_colors.dart';

class ChatRomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatRomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: context.responsive.spacingXXL,
      centerTitle: true,
      title: Row(
        spacing: context.responsive.spacingS,
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: LightColors.blow,
            child: Icon(Icons.person, color: Colors.white, size: 15),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الموارد البشرية',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                'متصل الآن',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: LightColors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 60);
}
