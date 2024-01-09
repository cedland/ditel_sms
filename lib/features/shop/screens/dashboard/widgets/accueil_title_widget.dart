import 'package:flutter/material.dart';

import '../../../../../common/widgets/dashboard/text_principal.dart';
import '../../../../../common/widgets/dashboard/text_second.dart';
import '../../../../../utils/constants/colors.dart';
class AccueilTitleWidget extends StatelessWidget {
  const AccueilTitleWidget({
    super.key, required this.color, required this.width, required this.textprincipal, required this.textsecond, required this.principalcolor, required this.secondcolor, required this.textsecond2, required this.image,
  });
  final Color color;
  final double width;
  final String textprincipal;
  final String textsecond;
  final Color principalcolor;
  final Color secondcolor;
  final String textsecond2;
  final String image;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0,top: 25,bottom: 10,right: 28),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
          border: Border.all(
            color: Colors.transparent,
            width: 1
          )
        ),
        //margin: const EdgeInsets.fromLTRB(20, 20, 10, 10),
        height: 140,
        width: width,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextPrincipal(text: textprincipal, color: principalcolor,),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextSecond(text: textsecond, color: secondcolor,),
                        TextSecond(text: textsecond2, color: secondcolor,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                   image,
                    height: 280,
                  ),
                  const Positioned(
                    right: -20,
                    top: 5,
                    child: SizedBox(
                      width: 1,
                      height: 150,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}