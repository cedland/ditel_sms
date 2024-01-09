import 'chat.dart';

class Contact {
  final int id;
  final String name;
  final String image;
  final String function;
  final List<String> phoneNumber;
  final String email;
  final String group;
  final String business;
  final String address;
  final String complement;
  final String postalCode;
  final String city;
  final String country;
  final String comment;
  final int numberOfCalls;
  final int numberOfCallsLastWeek;
  final List<Chat> chats;
  final bool connect;

  Contact( {
    required this.id,
    required this.name,
    required this.image,
    required this.function,
    required this.phoneNumber,
    required this.email,
    required this.group,
    required this.business,
    required this.address,
    required this.complement,
    required this.postalCode,
    required this.city,
    required this.country,
    required this.comment,
    required this.numberOfCalls,
    required this.numberOfCallsLastWeek,
    required this.connect,
    List<Chat>? chats,
  }) : chats = chats ?? [];
}
