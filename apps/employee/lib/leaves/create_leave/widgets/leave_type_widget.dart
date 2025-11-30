import 'package:core/utils/validators.dart';
import 'package:employee/leaves/logic/cubit.dart';
import 'package:employee/leaves/logic/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeaveTypeWidget extends StatefulWidget {
  const LeaveTypeWidget({super.key});

  @override
  State<LeaveTypeWidget> createState() => _LeaveTypeWidgetState();
}

class _LeaveTypeWidgetState extends State<LeaveTypeWidget> {
 // String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeavesCubit,LeavesStats>(
      builder: (context,state){
        return DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: 'اختر نوع الاجازه',
            hintStyle: Theme.of(context).textTheme.bodySmall,
            border: OutlineInputBorder(),
          ),
          dropdownColor: Colors.white,
          elevation: 0,
          padding: EdgeInsets.zero,
          initialValue: state.typeValue,
          validator: (value)=>Validator.fieldRequerd(value),
          items: ['اجازه سنويه', 'اجازه مرضيه', 'اجازه عارضه']
              .map(
                (item) => DropdownMenuItem(
              value: item,
              child: Text(item, style: Theme.of(context).textTheme.bodyLarge),
            ),
          )
              .toList(),
          onChanged: (value) =>
              context.read<LeavesCubit>().selectedType(value)
          ,
        );
      },

    );
  }
}
