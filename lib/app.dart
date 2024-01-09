import 'dart:ui';
import 'package:flutter/material.dart';
import 'data/dummy_data.dart';
import 'features/shop/screens/campagne/campagne_web.dart';
import 'features/shop/screens/campagne/nouvelle_campagne.dart';
import 'features/shop/screens/campagne/widgets/rediger_message.dart';
import 'features/shop/screens/campagne/widgets/text.dart';
import 'features/shop/screens/contacts/add_contact.dart';
import 'features/shop/screens/contacts/contact_list.dart';
import 'features/shop/screens/contacts/widget_contact/widget_contact.dart';
import 'features/shop/screens/dashboard/dashbord.dart';
import 'features/shop/screens/dashboard/dashbord2.dart';
import 'features/shop/screens/login/sign_in_recovery.dart';
import 'features/shop/screens/login/sign_in_screen.dart';
import 'features/shop/screens/login/sign_up1_screen.dart';
import 'features/shop/screens/login/sign_up_screen.dart';
import 'features/shop/screens/message/message_web.dart';
import 'features/shop/screens/messenger/message_empty.dart';
import 'features/shop/screens/settings/setting_information.dart';
import 'features/shop/search.dart';
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse},
      ),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: const SignInScreen(),
      //home: Dashboard(),
      //home: const Dashboard2(),
      //:MessageEmpty()
      //home:ContactList()
      //home: AddContact(),
      //home: MessagesWeb(),
      //home:const CampagneWeb(),
      //home: const NouvelleCampagneWeb(),
      //home: const RedigerMessage(),
      //home: const SettingInformation(),
      //home:WidgetContact()
     // home:const Search()
      //home: const SearchPage(),
      //home: SearchPage(),
      //home: SearchNew(),


    );
  }
}