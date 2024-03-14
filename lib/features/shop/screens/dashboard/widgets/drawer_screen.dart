
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../contacts/widgets/container_actif.dart';
import '../../message/message_web.dart';
import '../dashbord.dart';
import 'container_actif_drawer.dart';
import 'icon_drawer.dart';
class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  var pageId = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Dashboard(0)),
                            );
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const MessagesWeb()),
                            );
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
    );
  }
}

