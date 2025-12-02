
import 'package:employee/chats/chat_rome/widgets/chat_rome_app_bar.dart';
import 'package:employee/chats/chat_rome/widgets/message_item.dart';
import 'package:employee/chats/chat_rome/widgets/send_message.dart';
import 'package:flutter/material.dart';


class ChatRomeScreen extends StatelessWidget {
  const ChatRomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: ChatRomeAppBar(),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return MessageItem();
                },
              ),
            ),
           const SendMessage(),
          ],
        ),
      ),
    );
  }
}
