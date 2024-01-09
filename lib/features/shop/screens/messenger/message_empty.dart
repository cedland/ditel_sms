import 'package:flutter/material.dart';

import '../dashboard/widgets/dashboard_app_bar.dart';
import '../../../../common/widgets/messengers/messenger_app_bar.dart';
import '../../../../utils/constants/colors.dart';
import '../dashboard/widgets/drawer_screen.dart';

class MessageEmpty extends StatelessWidget {
  const MessageEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MessengerAppBar(title: "Messages"),
      backgroundColor: TColors.bg,
      drawer:const DrawerScreen(),
      body: Padding(
        padding: const EdgeInsets.only(left: 100.0),
        child: Container(
          width: 331,
          height: 901,
          //color: Colors.red,
          child: Container(
            child: Row(
              children: [

              ],
            ),
          )
        ),
      ),
    );
  }
}
