import 'package:core/utils/responsive_helper.dart';
import 'package:employee/chats/widgets/contact_item.dart';
import 'package:employee/chats/widgets/search_chats.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  final void Function()? onChatRome;
  const ChatsScreen({super.key, this.onChatRome});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchChats(),
        SizedBox(height: context.responsive.spacingS),
        const Divider(),

        Expanded(
          child: ListView.separated(
            itemCount: 4,
            separatorBuilder: (context,index)=>const Divider(),

            itemBuilder: (context,index)=>
            ContactItem(
              onChatRome: onChatRome,
            ),
          ),
        ),
      ],
    );
  }
}
