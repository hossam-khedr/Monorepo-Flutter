import 'package:core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:theme/theming/colors/light_colors.dart';

class ContactItem extends StatelessWidget {
  final void Function()? onChatRome;
  const ContactItem({super.key, this.onChatRome});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  context.responsive.symmetricPadding(
        vertical: 1.0,
        horizontal: 1.5
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap:onChatRome ,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: LightColors.blow,
              child: Icon(Icons.person,color: Colors.white,size: 20,),
            ),
          ),
          SizedBox(width: context.responsive.spacingM,),
          Column(
            spacing: context.responsive.spacingXS,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('سارة أحمد',style: Theme.of(context).textTheme.bodyLarge,),
              Text('شكراً لك على إنجاز المشروع',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.grey
              ),
              ),
            ],
          ),
          Spacer(),
          Text('أمس',style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.grey
          )),
        ],
      ),
    );
  }
}
