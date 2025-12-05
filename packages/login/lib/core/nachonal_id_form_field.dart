import 'package:core/constants/app_strings.dart';
import 'package:core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/widgets/asset_icon.dart';
import 'package:core/constants/svg_icons.dart';

class NachonalIdFormField extends StatefulWidget {
  final TextEditingController nationalIdIdController;
  final String? Function(String?)? validator;
  const NachonalIdFormField({super.key, required this.nationalIdIdController, this.validator});

  @override
  State<NachonalIdFormField> createState() => _NachonalIdFormFieldState();
}

class _NachonalIdFormFieldState extends State<NachonalIdFormField> {
  bool initValue = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      validator: widget.validator,
      controller: widget.nationalIdIdController,
      obscureText: initValue,
      decoration: InputDecoration(
        hintText: AppStrings.myEmployeeId,
        prefixIcon: Padding(
          padding: context.responsive.symmetricPadding(
              horizontal: 4.0
          ),
          child: AssetIcon(assetName:  SvgIcons.idIcon),
        ),
        suffixIcon: InkWell(
          onTap: () => setState(() {
            initValue = !initValue;
          }),
          child: Padding(
            padding: context.responsive.symmetricPadding(
              horizontal: 4.0
            ),
            child: AssetIcon(
             assetName:  initValue
                  ? SvgIcons.eyeOff
                  : SvgIcons.eyeOn,

            ),
          ),
        ),
      ),
    );
  }
}
