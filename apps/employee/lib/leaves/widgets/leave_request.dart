import 'package:employee/app/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:theme/theming/colors/light_colors.dart';

class CreateLeaveRequest extends StatelessWidget {
  final void Function()? onLeaveRequest;
  const CreateLeaveRequest({super.key, this.onLeaveRequest});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onLeaveRequest ,
      child: CircleAvatar(
        radius: 18,
        backgroundColor: LightColors.blow,
        child: Icon(AppIcons.add,color: Colors.white,),
      ),
    );
  }
}
