import 'package:flutter/material.dart';

class RowItem extends StatelessWidget {
  final String hint;
  final String data;
  const RowItem({super.key, required this.hint, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(hint ,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Colors.grey[400]
        ),),
        Text(data,style: Theme.of(context).textTheme.bodyLarge,)
      ],
    );
  }
}
