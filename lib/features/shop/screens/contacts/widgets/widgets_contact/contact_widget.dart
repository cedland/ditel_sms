import 'package:ditel_sms_app/classes/contact.dart';
import 'package:flutter/material.dart';

import '../../../../../../data/dummy_data.dart';
import '../contact_list_view.dart';
import '../group_widget.dart';
class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key, required Contact contact,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Row(
        children: [
          GroupWidget(),
          Expanded(
              child: ContactListView()),
        ],
      ),
    );
  }
}