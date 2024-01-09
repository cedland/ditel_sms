import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
class IconDrawer extends StatelessWidget {
  const IconDrawer({
    super.key, required this.color, required this.icon, required this.onPressed,
  });
  final Color color;
  final Icon icon;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:12.0),
      child: Center(
        child: IconButton(color: color, onPressed:onPressed, icon: icon,iconSize: 24,hoverColor: TColors.bg,),
      ),
    );
  }
}