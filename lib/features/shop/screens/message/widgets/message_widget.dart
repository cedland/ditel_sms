import 'package:flutter/material.dart';

import '../../../../../classes/chat.dart';
import '../../../../../classes/contact.dart';
import '../../../../../data/dummy_data.dart';
import '../../../../../utils/constants/colors.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key, required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    final Contact contact = contacts.firstWhere((c) => c.id == chat.contactId);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              contact.image,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    contact.name,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(
                        fontFamily: "LatoBold",
                        fontSize: 14,
                        color: TColors.title),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    chat.messages[chat.messages.length - 1].sendingTime
                        .toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(
                        color: TColors.txtbouttongreydark,
                        fontSize: 14,
                      fontFamily: "LatoRegular",),
                  ),
                ],
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width/8,
                ),
                child: Text(
                  chat.messages[chat.messages.length - 1].messageContent,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                      color: TColors.txtbouttongreydark,
                      fontSize: 13,
                    fontFamily: "LatoRegular",),
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromARGB(255, 236, 238, 245),
              ),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz,
                color: Color.fromARGB(255, 128, 131, 163),
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
