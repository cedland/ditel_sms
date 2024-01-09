
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
class ContainerActifDrawer extends StatelessWidget {
  const ContainerActifDrawer({
    super.key, required this.icon, required this.actif,
  });
  final IconData icon;
  final bool actif;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          border: actif ? Border.all(color: TColors.txtbouttongrey, width: 1): Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(8), color: TColors.bg),
        padding: const EdgeInsets.all(5),
        child: Icon(icon,color: actif ? TColors.bgboutton: TColors.subtitle,size: 22,),
      ),
    );
  }
}