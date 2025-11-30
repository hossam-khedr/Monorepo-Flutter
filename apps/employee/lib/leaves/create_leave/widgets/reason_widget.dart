import 'package:core/utils/validators.dart';
import 'package:flutter/material.dart';

class ReasonWidget extends StatelessWidget {
  final TextEditingController reasonController;
  const ReasonWidget({super.key, required this.reasonController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: reasonController,
      decoration: InputDecoration(
        hintText: 'اكتب سبب طلب الاجازه...',
      ),
      maxLines: 5,
      validator: (value) => Validator.fieldRequerd(value),
    );
  }
}
