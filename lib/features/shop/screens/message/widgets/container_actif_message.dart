
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
class ContainerActifMessage extends StatelessWidget {
  const ContainerActifMessage({
    super.key, required this.text1, required this.text2, required this.icon, required this.actif, required this.etiquette, this.color, this.text3,
  });
  final String text1;
  final String text2;
  final IconData icon;
  final bool actif;
  final bool etiquette;
  final Color? color;
  final String? text3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: actif ? const Color.fromARGB(255, 248, 249, 252) : TColors.bg),
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: actif ? TColors.greycontact : TColors.bg),
                child: Icon(
                  icon,
                  color: actif ? TColors.bgboutton : TColors.subtitle,
                  size: 18,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: actif ? Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(
                        fontFamily: "LatoBold",
                        fontSize: 13,
                        color: const Color
                            .fromARGB(255,
                            107, 89, 204)) : Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(
                      fontFamily: "LatoBold",
                      fontSize: 13,
                      color: TColors.title
                    ),
                  ),
                  const SizedBox(height: 3,),
                  Text(
                    text2,
                    style: actif ? Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(
                      color: const Color
                          .fromARGB(
                          255, 128, 131, 163),
                      fontSize: 12,
                      fontFamily: "LatoRegular",
                    ) :
                    Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(
                      color: const Color
                          .fromARGB(
                          255, 128, 131, 163),
                      fontSize: 12,
                      fontFamily: "LatoRegular",
                    ),
                  ),
                ],
              ),
              const Spacer(),
              //SizedBox(width: 20,),
              etiquette ? Container(
                width: 35,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(text3!,style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(
                        fontFamily: "LatoBold",
                        fontSize: 12,
                        color: TColors.bg)),
                  ),
                ),
              ): Text('')
            ],
          ),
        ),
      ),
    );
  }
}