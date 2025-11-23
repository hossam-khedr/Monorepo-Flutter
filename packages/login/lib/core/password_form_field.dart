import 'package:flutter/material.dart';
import 'package:theme/theming/colors/light_colors.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController passwordController;
  final String? Function(String?)? validator;
  const PasswordFormField({
    super.key,
    required this.passwordController,
    this.validator,
  });

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool initValue = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, sateState) => TextFormField(
        validator: widget.validator,
        controller: widget.passwordController,
        obscureText: initValue,
        decoration: InputDecoration(
          hintText: 'ادخل كلمة المرور',
          prefixIcon: Icon(Icons.lock),
          suffixIcon: InkWell(
            onTap: () => setState(() {
              initValue = !initValue;
            }),
            child: Icon(
              initValue
                  ? Icons.visibility_off_rounded
                  : Icons.remove_red_eye_rounded,
              color: initValue ? LightColors.blow : Colors.grey[400],
            ),
          ),
        ),
      ),
    );
  }
}
