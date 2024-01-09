import 'package:ditel_sms_app/features/shop/screens/contacts/widgets/contact_app_bar.dart';
import 'package:ditel_sms_app/features/shop/screens/contacts/widgets/group_add.dart';
import 'package:flutter/material.dart';

import '../dashboard/widgets/dashboard_app_bar.dart';
import '../../../../common/widgets/messengers/messenger_app_bar.dart';
import '../../../../data/dummy_data.dart';
import '../../../../utils/constants/colors.dart';
import '../dashboard/widgets/drawer_screen.dart';

class AddContact extends StatelessWidget {
  const AddContact({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ContactAppBar(title: "Ajouter un nouveau contact", config: false,),
      backgroundColor: TColors.bg,
      drawer:DrawerScreen(),
      body: Padding(
        padding: EdgeInsets.only(left: 100.0),
        child: GroupAdd(),
      ),
    );
  }
}

/*Expanded(
                child: InformationGenerale()),*/


