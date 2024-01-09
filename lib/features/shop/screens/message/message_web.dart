import 'package:ditel_sms_app/features/shop/screens/message/widgets/message_app_bar.dart';
import 'package:ditel_sms_app/features/shop/screens/message/widgets/message_groupe.dart';
import 'package:flutter/material.dart';

import '../dashboard/widgets/dashboard_app_bar.dart';
import '../../../../common/widgets/messengers/messenger_app_bar.dart';
import '../../../../data/dummy_data.dart';
import '../../../../utils/constants/colors.dart';
import '../dashboard/widgets/drawer_screen.dart';

class MessagesWeb extends StatelessWidget {
  const MessagesWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MessageAppBar(title: "Messages", config: true,),
      backgroundColor: TColors.bg,
      drawer:DrawerScreen(),
      body: Padding(
        padding: EdgeInsets.only(left: 100.0),
        child: MessageGroupe(),
      ),
    );
  }
}

/*Expanded(
                child: InformationGenerale()),*/


