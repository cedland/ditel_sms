
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../dashbord.dart';
import 'icon_drawer.dart';
class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 84,
      color: TColors.bg,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // Important: Remove any padding from the ListView
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 11.0),
              child: SizedBox(
                width: 30,
                height: 30,
                child: Center(child: Image.asset('assets/icons/logoicon.png'),
              )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 90.5),
              child: SizedBox(
                width: 84,
                //height: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconDrawer(color: TColors.bgboutton, onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder:(context) =>  Dashboard())
                      );
                    }, icon: const Icon(Icons.home),),
                    IconDrawer(color: TColors.txtbouttongreydark, onPressed: () {}, icon: const Icon(Icons.message),),
                    IconDrawer(color: TColors.txtbouttongreydark, onPressed: () {}, icon: const Icon(Icons.call),),
                    IconDrawer(color: TColors.txtbouttongreydark, onPressed: () {}, icon: const Icon(Icons.laptop_chromebook),),
                    IconDrawer(color: TColors.txtbouttongreydark, onPressed: () {}, icon: const Icon(Icons.people),),
                    IconDrawer(color: TColors.txtbouttongreydark, onPressed: () {}, icon: const Icon(Icons.upload),),
                    IconDrawer(color: TColors.txtbouttongreydark, onPressed: () {}, icon: const Icon(Icons.calendar_month),),
                    IconDrawer(color: TColors.txtbouttongreydark, onPressed: () {}, icon: const Icon(Icons.settings),),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

