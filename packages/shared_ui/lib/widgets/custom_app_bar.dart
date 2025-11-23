import 'package:core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? action;
  final VoidCallback? onBackPressed;
  final bool showAction;

  const CustomAppBar({
    super.key,
    this.title,
    this.action,
    this.onBackPressed,
    this.showAction = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.008,
          vertical: context.screenHeight * 0.008,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: onBackPressed ?? () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back),
            ),

            Expanded(
              child: Text(
                title ?? '',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            showAction && action != null
                ? action!
                : SizedBox(width: context.screenWidth * 0.008),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 60);
}