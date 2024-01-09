import 'package:ditel_sms_app/features/shop/screens/campagne/widgets/campagne_app_bar.dart';
import 'package:ditel_sms_app/features/shop/screens/campagne/widgets/nouvelle_campagne_groupe.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../dashboard/widgets/drawer_screen.dart';

class NouvelleCampagneWeb extends StatefulWidget {
  const NouvelleCampagneWeb({super.key});

  @override
  State<NouvelleCampagneWeb> createState() => NouvelleCampagneWebState();
}

class NouvelleCampagneWebState extends State<NouvelleCampagneWeb> {
  var isSearchExpanded = false;
  var pageId = 0;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CampagneAppBar(title: "Nouvelle campagne", date: false, navig: false,),
      backgroundColor: TColors.bg,
      drawer:DrawerScreen(),
      body: Padding(
        padding: EdgeInsets.only(left: 100.0),
        child: NouvelleCampagneGroupe(),
      ),
    );
  }
}
