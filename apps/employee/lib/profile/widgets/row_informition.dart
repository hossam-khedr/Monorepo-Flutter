import 'package:flutter/material.dart';

class RowInformetion extends StatelessWidget {
  final String hint;
  final String data;

  const RowInformetion({super.key, required this.hint, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          hint,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
        ),
        Text(data, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
