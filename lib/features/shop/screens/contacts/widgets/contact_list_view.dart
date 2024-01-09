import 'package:flutter/material.dart';

import '../../../../../classes/contact.dart';
import 'contact_detailled.dart';
import 'contact_info.dart';
import 'contact_page_select.dart';
class ContactListView extends StatefulWidget {
  final List<Contact> contacts;

  const ContactListView({super.key, required this.contacts});

  @override
  ContactListViewState createState() => ContactListViewState();
}

class ContactListViewState extends State<ContactListView> {
  int? selectedContactIndex;

  void _onContactPressed(int index) {
    setState(() {
      selectedContactIndex = index;
    });
  }

  void _onClosePressed() {
    setState(() {
      selectedContactIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 130,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: widget.contacts.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      _onContactPressed(index);
                    },
                    child: ContactDetailed(contact: widget.contacts[index], connected: widget.contacts[index].connect,),
                  );
                },
              ),
            ),
            const ContactPageSelect()
          ],
        ),
        if (selectedContactIndex != null)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: ContactInfo(
              contact: widget.contacts[selectedContactIndex!],
              onClosePressed: _onClosePressed,
            ),
          ),
      ],
    );
  }
}