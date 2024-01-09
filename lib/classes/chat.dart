import 'message.dart';

class Chat {
  final int contactId;
  final List<Message> messages;

  Chat({required this.contactId, required this.messages});
}
