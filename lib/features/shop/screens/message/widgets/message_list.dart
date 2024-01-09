
import 'package:flutter/material.dart';

import '../../../../../classes/contact.dart';
import '../../../../../utils/constants/colors.dart';
import 'chat_widget.dart';
import 'message_widget.dart';
class MessageList extends StatefulWidget {
  const MessageList({super.key, required this.you});

  final Contact you;

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  var selectedContactIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width * 0.22,
            height: MediaQuery.of(context).size.height - 80,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.you.chats.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedContactIndex = index;
                    });
                  },
                  child:
                  MessageWidget(chat: widget.you.chats[index]),
                );
              },
            ),
          ),
          selectedContactIndex == -1
              ? Expanded(
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/select_chat.png',
                      width: 300,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Sélectionner message",style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontFamily: 'LatoBold',color: TColors.title,fontSize: 26)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Choisisser un contact pour faire apparaitre la discussion",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 14,
                      fontFamily: 'LatoRegular',
                      color: TColors.subtitle, ),)
                  ],
                ),
              ),
            ),
          ): Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: ChatScreen(
                  chat:
                  widget.you.chats[selectedContactIndex],
                  you: widget.you),
            ),
          ),

        ],
      ),
    );
  }
}
