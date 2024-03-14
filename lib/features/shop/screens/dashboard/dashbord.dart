import 'dart:ui';
import 'package:ditel_sms_app/features/shop/screens/dashboard/widgets/container_actif_drawer.dart';
import 'package:flutter/material.dart';
import '../../../../classes/contact.dart';
import '../appbar/appbar_ditel.dart';
import '../campagne/widgets/campagne_groupe.dart';
import '../campagne/widgets/nouvelle_campagne_groupe.dart';
import '../contact_groupe/contact_groupe.dart';
import '../contacts/widget_contact/widget_contact.dart';
import '../contacts/widgets/group_add.dart';
import '../message/widgets/message_groupe.dart';
import '../settings/widgets/groupe_settings.dart';
import 'widgets_dashboard/dashborad_widget.dart';
import '../../../../data/dummy_data.dart';
import '../../../../utils/constants/colors.dart';


class Dashboard extends StatefulWidget {
  Dashboard(this.idPage, {super.key});
  final List<Contact> _allUsers = contacts;
  final int? idPage;
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var pageId = 0;
  bool ajouter = true;
  bool titresimple = false;
  bool showsearch = false;
  List contactdata=[];
  List contact = [];
  List searchContact =[];
  bool search = false;
  @override
  void initState() {
    pageId = widget.idPage!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {PointerDeviceKind.mouse},),
      debugShowCheckedModeBanner: false,

      home: Scaffold(
          appBar: DitelAppBar(title: 'Dashboard', pageId: pageId, ajoutContact: () {
            setState(() {
              ajouter = !ajouter;
              titresimple = !titresimple;
            });
          }, titresimple: titresimple, search: (){
            setState(() {
              search = !search;
            });
          }, showsearch: showsearch,),
          backgroundColor: TColors.bg,
          //drawer:const DrawerScreen(),
          body: Row(
            children: [
              Container(
                height: double.infinity,
                width: 96,
                decoration: const BoxDecoration(
                  border: Border(
                      right: BorderSide(color: TColors.txtbouttongrey, width: 1)
                  ),
                  color: TColors.bg,
                ),
                child: Container(
                  width: double.infinity,
                  color: TColors.bg,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // Important: Remove any padding from the ListView
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Center(child: Image.asset('assets/icons/logoicon.png'),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40.5),
                        child: SizedBox(
                          width: 84,
                          //height: 400,
                          //color: Colors.red,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pageId = 0;
                                      });
                                    },
                                    child: pageId == 0
                                        ? const ContainerActifDrawer(icon: Icons.home, actif: true,)
                                        : const ContainerActifDrawer(icon: Icons.home, actif: false,)
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pageId = 1;
                                      });
                                    },
                                    child: pageId == 1
                                        ? const ContainerActifDrawer(icon: Icons.message,actif: true,)
                                        : const ContainerActifDrawer(icon: Icons.message,actif: false,)
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pageId = 2;
                                      });
                                    },
                                    child: pageId == 2
                                        ? const ContainerActifDrawer(icon: Icons.call,actif: true,)
                                        : const ContainerActifDrawer(icon: Icons.call,actif: false,)
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pageId = 3;
                                      });
                                    },
                                    child: pageId == 3
                                        ? const ContainerActifDrawer(icon: Icons.laptop_chromebook,actif: true,)
                                        : const ContainerActifDrawer(icon: Icons.laptop_chromebook,actif: false,)
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pageId = 4;
                                      });
                                    },
                                    child: pageId == 4
                                        ? const ContainerActifDrawer(icon: Icons.people,actif: true,)
                                        : const ContainerActifDrawer(icon: Icons.people,actif: false,)
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pageId = 5;
                                      });
                                    },
                                    child: pageId == 5
                                        ? const ContainerActifDrawer(icon: Icons.upload,actif: true,)
                                        : const ContainerActifDrawer(icon: Icons.upload,actif: false,)
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pageId = 6;
                                      });
                                    },
                                    child: pageId == 6
                                        ? const ContainerActifDrawer(icon: Icons.calendar_month,actif: true,)
                                        : const ContainerActifDrawer(icon: Icons.calendar_month,actif: false,)
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pageId = 7;
                                      });
                                    },
                                    child: pageId == 7
                                        ? const ContainerActifDrawer(icon: Icons.settings,actif: true,)
                                        : const ContainerActifDrawer(icon: Icons.settings,actif: false,)
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12,),
              pageId == 0 ?  DashboardWidget(search: search,) :
              (pageId == 1 ?
              Container(
                  width: 1428,
                  height: double.infinity,
                  color: TColors.bg,
                  child: const MessageGroupe())
                  :
              (pageId == 2 ?
              Container(
                width: 1428,
                height: double.infinity,
                color: TColors.bg,
                child: ajouter ? const ContactWidgets() : const GroupAdd(),) :
              (pageId == 3 ? const Text('') :
              (pageId == 4 ? Container(
                width: 1428,
                height: double.infinity,
                color: TColors.bg,
                child: const NouvelleCampagneGroupe(),) :
              (pageId == 5 ? Container(
                width: 1428,
                height: double.infinity,
                color: TColors.bg,
                child: const ContactGroupe(),) :
              (pageId == 6 ? Container(
                width: 1428,
                height: double.infinity,
                color: TColors.bg,
                child: const CampagneGroupe(),) :
              Container(
                width: 1428,
                height: double.infinity,
                color: TColors.bg,
                child: const GroupSetting(),))))))

              )
            ],
          )
      ),
    );
  }
}










