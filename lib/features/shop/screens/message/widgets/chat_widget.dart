import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../classes/chat.dart';
import '../../../../../classes/contact.dart';
import '../../../../../classes/message.dart';
import '../../../../../data/dummy_data.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.chat, required this.you});

  final Contact you;
  final Chat chat;

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final FocusNode _messageFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  Contact? otherPerson;

  DateTime? _lastMessageTime;
  bool _shouldDisplayImageAndTime = true;

  @override
  void initState() {
    _messageController.addListener(_handleTextChange);
    super.initState();
  }

  void _handleTextChange() {
    setState(() {});
  }

  void _sendMessage() {
    String message = _messageController.text.trim();
    if (message.isNotEmpty) {
      var _currentTime = _getCurrentTime();
      setState(() {
        widget.chat.messages.add(Message(
          sendingTime: _currentTime,
          senderId: 1,
          messageContent: message,
        ));
      });
      _messageController.clear();
      _messageFocusNode.requestFocus();
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    }
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    final timeFormat = DateFormat('hh:mm a');
    return timeFormat.format(now);
  }

  @override
  Widget build(BuildContext context) {
    otherPerson = contacts.firstWhere((c) => c.id == widget.chat.contactId);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: widget.chat.messages.length,
            itemBuilder: (BuildContext context, int index) {
              final currentMessage = widget.chat.messages[index];

              if (index == 0) {
                _shouldDisplayImageAndTime = true;
              } else {
                final prevMessage = widget.chat.messages[index - 1];
                final currentMessageTime =
                DateFormat('hh:mm a').parse(currentMessage.sendingTime);
                final prevMessageTime =
                DateFormat('hh:mm a').parse(prevMessage.sendingTime);

                final differenceInSeconds =
                    currentMessageTime.difference(prevMessageTime).inSeconds;

                if (currentMessage.senderId == prevMessage.senderId &&
                    differenceInSeconds <= 120) {
                  _shouldDisplayImageAndTime = false;
                } else {
                  _shouldDisplayImageAndTime = true;
                }
              }

              return _buildMessage(currentMessage);
            },
          ),
        ),
        _buildMessageInput(),
      ],
    );
  }

  Widget _buildMessage(Message message) {
    bool isSentByYou = message.senderId == 1;

    return isSentByYou
        ? ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _shouldDisplayImageAndTime
                  ? Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    message.sendingTime,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                      color: const Color.fromARGB(
                          255, 128, 131, 163),
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    widget.you.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              )
                  : Row(),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 107, 89, 204),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  message.messageContent,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          _shouldDisplayImageAndTime
              ? Container(
            padding: const EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.you.image,
                width: 35,
                height: 35,
                fit: BoxFit.cover,
              ),
            ),
          )
              : Container(
            width: 45,
          )
        ],
      ),
    )
        : ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _shouldDisplayImageAndTime
              ? Container(
            padding: const EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                otherPerson!.image,
                width: 35,
                height: 35,
                fit: BoxFit.cover,
              ),
            ),
          )
              : Container(
            width: 45,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _shouldDisplayImageAndTime
                  ? Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    otherPerson!.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontFamily: "LatoBold",fontSize: 14),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    message.sendingTime,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                      color: const Color.fromARGB(
                          255, 128, 131, 163),
                        fontFamily: "LatoRegular",fontSize: 14
                    ),
                  ),
                ],
              )
                  : Row(),
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 3),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 243, 244, 249),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  message.messageContent,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color:Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 243, 244, 249)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: _messageFocusNode,
              controller: _messageController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Type to add your message',
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: const Color.fromARGB(255, 128, 131, 163),
                ),
              ),
              onSubmitted: (_) {
                _sendMessage();
              },
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.insert_emoticon,
              color: Color.fromARGB(255, 128, 131, 163),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Color.fromARGB(255, 128, 131, 163),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 107, 89, 204),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.send,
                color: Colors.white,
                size: 18,
              ),
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}
