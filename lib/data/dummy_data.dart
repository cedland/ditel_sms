import '../../classes/contact.dart';
import '../../classes/event.dart';
import '../classes/chat.dart';
import '../classes/message.dart';

final List<Contact> contacts = [
  Contact(
      id: 1,
      name: 'John Doe',
      image:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCczoMDFIc77qVeqtnJ26h8Yen0WXNfyLTIg&usqp=CAU',
      function: 'Developer',
      numberOfCalls: 123,
      numberOfCallsLastWeek: 262,
      phoneNumber: ["490-645-3877"],
      email: "John.stevens@gmail.com",
      group: "business",
      business: "BMW",
      address: "Street 31 August 1989, 32",
      complement: "Office 320",
      postalCode: "2008",
      city: "Paris",
      country: "France",
      connect: true,
      comment:
      "When I first got into the advertising, I was looking for the magical combination that would put website into the top search engine rankings",
      chats: [
        Chat(
          contactId: 2,
          messages: [
            Message(
                sendingTime: "11:24 AM", senderId: 2, messageContent: "Hello!"),
            Message(
                sendingTime: "11:25 AM",
                senderId: 2,
                messageContent: "How are you?"),
            Message(
                sendingTime: "11:49 AM",
                senderId: 2,
                messageContent: "Welcome to the chat"),
            Message(
                sendingTime: "11:50 AM",
                senderId: 1,
                messageContent: "Hi, I'm fine, how about you?"),
            Message(
                sendingTime: "11:51 AM",
                senderId: 2,
                messageContent: "I'm doing great, thanks for asking!"),
            Message(
                sendingTime: "11:52 AM",
                senderId: 2,
                messageContent: "I'm excited to chat with you."),
            Message(
                sendingTime: "11:53 AM",
                senderId: 1,
                messageContent:
                "Likewise! This chat feature seems really cool."),
            Message(
                sendingTime: "11:54 AM",
                senderId: 1,
                messageContent: "By the way, how's your day going?"),
            Message(
                sendingTime: "11:55 AM",
                senderId: 2,
                messageContent: "My day is going smoothly so far."),
            Message(
                sendingTime: "11:56 AM",
                senderId: 2,
                messageContent: "I've been catching up on some work."),
            Message(
                sendingTime: "11:57 AM",
                senderId: 1,
                messageContent:
                "That sounds productive. I should probably be working too, but chatting is more fun!"),
            Message(
                sendingTime: "11:58 AM",
                senderId: 1,
                messageContent: "What kind of work do you do?"),
            Message(
                sendingTime: "11:59 AM",
                senderId: 2,
                messageContent: "I work in software development."),
            Message(
                sendingTime: "12:00 PM",
                senderId: 2,
                messageContent: "It's challenging but I enjoy it."),
            Message(
                sendingTime: "12:01 PM",
                senderId: 1,
                messageContent: "That's awesome! I'm in marketing myself."),
            Message(
                sendingTime: "12:02 PM",
                senderId: 1,
                messageContent:
                "Both our fields involve a lot of creativity, don't they?"),
            Message(
                sendingTime: "12:03 PM",
                senderId: 2,
                messageContent:
                "Absolutely! Creativity keeps the work interesting."),
            Message(
                sendingTime: "12:04 PM",
                senderId: 2,
                messageContent:
                "Speaking of which, have you seen any good movies lately?"),
            Message(
                sendingTime: "12:05 PM",
                senderId: 1,
                messageContent:
                "Yes, I watched the new sci-fi film that just came out."),
            Message(
                sendingTime: "12:06 PM",
                senderId: 1,
                messageContent: "The visuals were stunning!"),
            Message(
                sendingTime: "12:07 PM",
                senderId: 2,
                messageContent:
                "I've heard about that one. I need to check it out!"),
            Message(
                sendingTime: "12:08 PM",
                senderId: 2,
                messageContent: "Thanks for the recommendation."),
          ],
        ),
        Chat(
          contactId: 3,
          messages: [
            Message(
                sendingTime: "13:24 AM",
                senderId: 3,
                messageContent: "Hi man!"),
            Message(
                sendingTime: "13:25 AM",
                senderId: 3,
                messageContent: "How are you?"),
            Message(
                sendingTime: "13:49 AM",
                senderId: 3,
                messageContent: "Glad to see you here"),
            Message(
                sendingTime: "14:50 AM",
                senderId: 1,
                messageContent: "Hi, glad to see you too")
          ],
        ),
      ]),
  Contact(
      id: 2,
      name: 'Jane Smith',
      image:
      'https://th.bing.com/th/id/OIP.PztowP3ljup0SM75tkDimQHaHa?w=199&h=199&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      function: 'Marketing',
      numberOfCalls: 253,
      numberOfCallsLastWeek: 352,
      phoneNumber: ["490-645-3877"],
      email: "jane.stevens@gmail.com",
      group: "business",
      business: "BMW",
      address: "Street 31 August 1989, 32",
      complement: "Office 320",
      postalCode: "2008",
      city: "Paris",
      country: "France",
      connect: true,
      comment:
      "When I first got into the advertising, I was looking for the magical combination that would put website into the top search engine rankings"),
  Contact(
      id: 3,
      name: 'Julia Enderson',
      image:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsynwv-5qtogtOwJbIjaPFJUmHpzhxgqIAug&usqp=CAU',
      function: 'Sales Manager',
      numberOfCalls: 123,
      numberOfCallsLastWeek: 352,
      phoneNumber: ["490-645-3877"],
      email: "johanna.stevens@gmail.com",
      group: "business",
      business: "BMW",
      address: "Street 31 August 1989, 32",
      complement: "Office 320",
      postalCode: "2008",
      city: "Paris",
      country: "France",
      connect: false,
      comment:
      "When I first got into the advertising, I was looking for the magical combination that would put website into the top search engine rankings"),
  Contact(
      id: 4,
      name: 'Dilan Blue',
      image:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1IuCl8Z6KrqWnsGGivIYvvbZozrZ8wEF4Wg&usqp=CAU',
      function: 'Programmer',
      numberOfCalls: 125,
      numberOfCallsLastWeek: 252,
      phoneNumber: ["490-645-3877"],
      email: "johanna.stevens@gmail.com",
      group: "business",
      business: "BMW",
      address: "Street 31 August 1989, 32",
      complement: "Office 320",
      postalCode: "2008",
      city: "Paris",
      country: "France",
      connect: false,
      comment:
      "When I first got into the advertising, I was looking for the magical combination that would put website into the top search engine rankings"),
  Contact(
      id: 5,
      name: 'Tim Book',
      image:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQStBOlxj3axOam62tE-S3zu3PHOOuRMPZi5A&usqp=CAU',
      function: 'Manager',
      numberOfCalls: 225,
      numberOfCallsLastWeek: 222,
      phoneNumber: ["490-645-3877"],
      email: "johanna.stevens@gmail.com",
      group: "business",
      business: "BMW",
      address: "Street 31 August 1989, 32",
      complement: "Office 320",
      postalCode: "2008",
      city: "Paris",
      country: "France",
      connect: false,
      comment:
      "When I first got into the advertising, I was looking for the magical combination that would put website into the top search engine rankings"),
  Contact(
      id: 6,
      name: 'John Doe',
      image:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCczoMDFIc77qVeqtnJ26h8Yen0WXNfyLTIg&usqp=CAU',
      function: 'Developer',
      numberOfCalls: 223,
      numberOfCallsLastWeek: 352,
      phoneNumber: ["490-645-3877"],
      email: "johanna.stevens@gmail.com",
      group: "business",
      business: "BMW",
      address: "Street 31 August 1989, 32",
      complement: "Office 320",
      postalCode: "2008",
      city: "Paris",
      country: "France",
      connect: false,
      comment:
      "When I first got into the advertising, I was looking for the magical combination that would put website into the top search engine rankings"),
  Contact(
      id: 7,
      name: 'Jane Smith',
      image:
      'https://th.bing.com/th/id/OIP.PztowP3ljup0SM75tkDimQHaHa?w=199&h=199&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      function: 'Marketing',
      numberOfCalls: 122,
      numberOfCallsLastWeek: 212,
      phoneNumber: ["490-645-3877"],
      email: "johanna.stevens@gmail.com",
      group: "business",
      business: "BMW",
      address: "Street 31 August 1989, 32",
      complement: "Office 320",
      postalCode: "2008",
      city: "Paris",
      country: "France",
      connect: true,
      comment:
      "When I first got into the advertising, I was looking for the magical combination that would put website into the top search engine rankings"),
  Contact(
      id: 8,
      name: 'Julia Enderson',
      image:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsynwv-5qtogtOwJbIjaPFJUmHpzhxgqIAug&usqp=CAU',
      function: 'Sales Manager',
      numberOfCalls: 253,
      numberOfCallsLastWeek: 134,
      phoneNumber: ["490-645-3877"],
      email: "johanna.stevens@gmail.com",
      group: "business",
      business: "BMW",
      address: "Street 31 August 1989, 32",
      complement: "Office 320",
      postalCode: "2008",
      city: "Paris",
      country: "France",
      connect: true,
      comment:
      "When I first got into the advertising, I was looking for the magical combination that would put website into the top search engine rankings"),
  Contact(
      id: 9,
      name: 'Dilan Blue',
      image:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1IuCl8Z6KrqWnsGGivIYvvbZozrZ8wEF4Wg&usqp=CAU',
      function: 'Programmer',
      numberOfCalls: 345,
      numberOfCallsLastWeek: 234,
      phoneNumber: ["490-645-3877"],
      email: "johanna.stevens@gmail.com",
      group: "business",
      business: "BMW",
      address: "Street 31 August 1989, 32",
      complement: "Office 320",
      postalCode: "2008",
      city: "Paris",
      country: "France",
      connect: false,
      comment:
      "When I first got into the advertising, I was looking for the magical combination that would put website into the top search engine rankings"),
  Contact(
      id: 10,
      name: 'Tim Book',
      image:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQStBOlxj3axOam62tE-S3zu3PHOOuRMPZi5A&usqp=CAU',
      function: 'Manager',
      numberOfCalls: 114,
      numberOfCallsLastWeek: 355,
      phoneNumber: ["490-645-3877"],
      email: "johanna.stevens@gmail.com",
      group: "business",
      business: "BMW",
      address: "Street 31 August 1989, 32",
      complement: "Office 320",
      postalCode: "2008",
      city: "Paris",
      country: "France",
      connect: false,
      comment:
      "When I first got into the advertising, I was looking for the magical combination that would put website into the top search engine rankings"),
  Contact(
      id: 11,
      name: 'Tim Book',
      image:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQStBOlxj3axOam62tE-S3zu3PHOOuRMPZi5A&usqp=CAU',
      function: 'Manager',
      numberOfCalls: 114,
      numberOfCallsLastWeek: 355,
      phoneNumber: ["490-645-3877"],
      email: "johanna.stevens@gmail.com",
      group: "business",
      business: "BMW",
      address: "Street 31 August 1989, 32",
      complement: "Office 320",
      postalCode: "2008",
      city: "Paris",
      country: "France",
      connect: false,
      comment:
      "When I first got into the advertising, I was looking for the magical combination that would put website into the top search engine rankings"),
];

final List<Event> upcomingEvents = [
  Event(
    type: "Business",
    title: 'Campagne discount -10%',
    date: DateTime.now(),
    image: "assets/images/dashboard/img1.png"
  ),
  Event(
    type: "Clients",
    title: 'Campagne discount -15%',
    date: DateTime.now(),
      image: "assets/images/dashboard/img2.png"
  ),
  Event(
    type: "Business",
    title: 'Campagne discount -5%',
    date: DateTime.now(),
      image: "assets/images/dashboard/img3.png"
  ),
  Event(
    type: "Clients",
    title: 'Campagne discount -20%',
    date: DateTime.now(),
      image: "assets/images/dashboard/img1.png"
  ),
  Event(
    type: "Business",
    title: 'Campagne discount -15%',
    date: DateTime.now(),
      image: "assets/images/dashboard/img2.png"
  ),
  Event(
    type: "Clients",
    title: 'Campagne discount -10%',
    date: DateTime.now(),
      image: "assets/images/dashboard/img3.png"
  ),
  Event(
    type: "Business",
    title: 'Campagne discount -15%',
    date: DateTime.now(),
      image: "assets/images/dashboard/img8.png"
  ),
  Event(
    type: "Clients",
    title: 'Campagne discount -20%',
    date: DateTime.now(),
      image: "assets/images/dashboard/img1.png"
  ),
];
