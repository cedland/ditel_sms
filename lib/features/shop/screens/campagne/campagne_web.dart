import 'package:ditel_sms_app/features/shop/screens/campagne/widgets/campagne_app_bar.dart';
import 'package:ditel_sms_app/features/shop/screens/campagne/widgets/campagne_groupe.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../dashboard/widgets/drawer_screen.dart';

class CampagneWeb extends StatefulWidget {
  const CampagneWeb({super.key});

  @override
  State<CampagneWeb> createState() => CampagneWebState();
}

class CampagneWebState extends State<CampagneWeb> {
  var isSearchExpanded = false;
  var pageId = 0;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CampagneAppBar(title: "Campagne", date: true, navig: true,),
      backgroundColor: TColors.bg,
      drawer:DrawerScreen(),
      body: Padding(
        padding: EdgeInsets.only(left: 100.0),
        child: CampagneGroupe(),
      ),
    );
  }
}
