import 'package:core/utils/date_formetter.dart';
import 'package:core/utils/validators.dart';
import 'package:employee/app/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit.dart';
import '../../logic/stats.dart';

class LeaveDate extends StatelessWidget {
  final TextEditingController controller;
  final void Function()? onDate;
  final DateTime? date;

  const LeaveDate(
      {super.key, required this.controller, this.onDate, this.date});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller:controller,
      decoration: InputDecoration(
        hintText: 'mm/dd/yyyy',
        suffixIcon: InkWell(
            onTap: onDate,
            child: Icon(AppIcons.calendar)),
      ),
      validator: (value)=>Validator.fieldRequerd(value),
    );
  }
}



