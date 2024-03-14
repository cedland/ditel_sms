import 'dart:convert';

import 'package:ditel_sms_app/features/shop/screens/dashboard/widgets/container_actif_drawer.dart';
import 'package:flutter/material.dart';
import 'package:ditel_sms_app/features/shop/screens/dashboard/widgets/contact_widget.dart';
import '../../../../classes/contact.dart';
import '../appbar/appbar_ditel.dart';
import '../campagne/widgets/campagne_groupe.dart';
import '../campagne/widgets/nouvelle_campagne_groupe.dart';
import '../contacts/widget_contact/widget_contact.dart';
import '../contacts/widgets/group_add.dart';
import '../dashboard/widgets_dashboard/dashborad_widget.dart';
import '../message/widgets/message_groupe.dart';
import '../settings/widgets/groupe_settings.dart';
import '../../../../data/dummy_data.dart';
import '../../../../utils/constants/colors.dart';
import 'package:http/http.dart' as http;
class CreerContact extends StatefulWidget {

  CreerContact({super.key});
  final List<Contact> _allUsers = contacts;

  @override
  State<CreerContact> createState() => _CreerCampagneState();
}

class _CreerCampagneState extends State<CreerContact> {
  var pageId = 2;
  bool ajouter = true;
  bool titresimple = false;
  bool showsearch = false;
  List contactdata=[];
  bool search = false;
  Future<void>getContact() async{
    String uri = "http://192.168.0.109/ditel_sms_php/get_all_contact.php";
    try{
      var response = await http.get(Uri.parse(uri));

      setState(() {
        contactdata = jsonDecode(response.body);
      });
    }
    catch(e){print(e);}
  }


  @override
  void initState() {
    getContact();
    super.initState();
  }

  void openPromoWidgetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(left: 1100.0,top: 20),
          child: Dialog(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(8),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width / 4 + 18,
              height: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 270,
                        height: 35,
                        decoration:BoxDecoration(
                            color: TColors.bg,
                            border: Border.all(
                                color: TColors.txtbouttongrey,
                                width: 1
                            ),
                            borderRadius: BorderRadius.circular(8)
                        ),

                        child: TextField(
                          //onChanged: (value) => _runFilter(value),
                          style: const TextStyle(color: TColors.title ,fontSize: 14),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: TColors.bg,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none
                              ),
                              hintText: "Search",
                              hintStyle: TextStyle(fontSize: 12)
                          ),
                        ),
                      ),
                      const SizedBox(width: 8,),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(8),
                            border: Border.all(width: 0.1)),
                        child: IconButton(
                          icon: const Icon(Icons.close, size: 18),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: contactdata.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: (){},
                            child: ContactWidget(image: contactdata[index]["image"], name: contactdata[index]["nom_prenom"], fonction: contactdata[index]["fonction"],)
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: const DashboardAppBar(title: "Dashboard"),
        appBar: DitelAppBar(title: 'Dashboard', pageId: pageId, ajoutContact: () {
          setState(() {
            ajouter = !ajouter;
            titresimple = !titresimple;
          });
        }, titresimple: !titresimple, search: (){
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
            //pageId == 0  ? const DashboardWidget() : Text('mAMAs')
            /*Container(
            width: 1428,
              height: double.infinity,
              color: TColors.bg,
              child: const ContactWidgets()),*/

            pageId == 0 ? DashboardWidget(search: search,):
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
              //child: ajouter ? const ContactWidgets() : const GroupAdd(),) :
            child:const GroupAdd()) :
            (pageId == 3 ? const Text('') :
            (pageId == 4 ? Container(
              width: 1428,
              height: double.infinity,
              color: TColors.bg,
              child: const NouvelleCampagneGroupe(),) :
            (pageId == 5 ? const Text('') :
            (pageId == 6 ? Container(
              width: 1428,
              height: double.infinity,
              color: TColors.bg,
              child: const CampagneGroupe(),) :
            Container(
              width: 1428,
              height: double.infinity,
              color: TColors.bg,
              child: const GroupSetting(),))

            )
            )

            )

            )

            )
          ],
        )
    );
  }
}










