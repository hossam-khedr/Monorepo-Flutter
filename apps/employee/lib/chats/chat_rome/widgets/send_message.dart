import 'package:core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:theme/theming/colors/light_colors.dart';

class SendMessage extends StatelessWidget {
  const SendMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero
        ),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: context.responsive.symmetricPadding(
              vertical: 3.6,
              horizontal: 4.0
          )
          ,child: Row(
          spacing: context.responsive.spacingM,
          children: [
            Container(
                padding: context.responsive.symmetricPadding(
                    horizontal: 1.5,
                    vertical: 1.5
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: LightColors.gray
                ),
                child: Icon(Icons.folder_copy_outlined,color: Colors.white,)),
            Container(
                padding: context.responsive.symmetricPadding(
                    horizontal: 1.5,
                    vertical: 1.5
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: LightColors.blow
                ),
                child: Icon(Icons.near_me_outlined,color: Colors.white,size: 20,)),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'اكتب رساله...',
                  helperStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: LightColors.gray
                  )
                  ),
              ),
            )
          ],
        ),
        )
    );
  }
}
