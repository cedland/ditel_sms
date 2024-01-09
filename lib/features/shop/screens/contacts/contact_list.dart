import 'package:ditel_sms_app/features/shop/screens/contacts/widget_contact/widget_contact.dart';
import 'package:ditel_sms_app/features/shop/screens/contacts/widgets/contact_app_bar.dart';
import 'package:flutter/material.dart';

import '../dashboard/widgets/dashboard_app_bar.dart';
import '../../../../common/widgets/messengers/messenger_app_bar.dart';
import '../../../../data/dummy_data.dart';
import '../../../../utils/constants/colors.dart';
import '../dashboard/widgets/drawer_screen.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ContactAppBar(title: "Contacts", config: true,),
      backgroundColor: TColors.bg,
      drawer:DrawerScreen(),
      body: ContactWidgets(),
    );
  }
}





