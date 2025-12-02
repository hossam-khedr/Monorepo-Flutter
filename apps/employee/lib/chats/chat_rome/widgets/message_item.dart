import 'package:core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:theme/theming/colors/dark_colors.dart';
import 'package:theme/theming/colors/light_colors.dart';

class MessageItem extends StatefulWidget {
  const MessageItem({super.key});

  @override
  State<MessageItem> createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  final bool _isSender = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _isSender
              ? SizedBox.shrink()
              : CircleAvatar(
                  radius: 15,
                  backgroundColor: LightColors.blow,
                  child: Icon(Icons.person, color: Colors.white, size: 15),
                ),
          Expanded(
            child: Column(
              crossAxisAlignment: _isSender
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Card(
                  color: _isSender
                      ? LightColors.blow
                      : DarkColors.cardColorDark,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: context.responsive.symmetricPadding(
                          horizontal: 2.0,
                          vertical: 2.0,
                        ),
                        child: Text(
                          'مرحباً أحمد، تم قبول طلب الإجازة السنوية الخاص بك من 15-20 نوفمبر 2024.',
                        ),
                      ),
                    ],
                  ),
                ),
                Text('10:30 ص'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
