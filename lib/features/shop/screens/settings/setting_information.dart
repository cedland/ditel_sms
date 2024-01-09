import 'package:ditel_sms_app/features/shop/screens/settings/widgets/groupe_settings.dart';
import 'package:ditel_sms_app/features/shop/screens/settings/widgets/settings_app_bar.dart';
import 'package:flutter/material.dart';

import '../dashboard/widgets/dashboard_app_bar.dart';
import '../../../../common/widgets/messengers/messenger_app_bar.dart';
import '../../../../data/dummy_data.dart';
import '../../../../utils/constants/colors.dart';
import '../dashboard/widgets/drawer_screen.dart';

class SettingInformation extends StatelessWidget {
  const SettingInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SettingsAppBar(title: "Paramètres", config: false,),
      backgroundColor: TColors.bg,
      drawer:DrawerScreen(),
      body: Padding(
        padding: EdgeInsets.only(left: 100.0),
        child: GroupSetting(),
      ),
    );
  }
}

/*Expanded(
                child: InformationGenerale()),*/


