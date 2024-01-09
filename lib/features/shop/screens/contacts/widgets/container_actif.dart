
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
class ContainerActif extends StatelessWidget {
  const ContainerActif({
    super.key, required this.text1, required this.text2, required this.icon, required this.actif,
  });
  final String text1;
  final String text2;
  final IconData icon;
  final bool actif;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: actif ? const Color.fromARGB(255, 248, 249, 252) : TColors.bg),
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: actif ? TColors.bgboutton : const Color.fromARGB(
                        255, 128, 131, 163)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 15,
                  ),
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
                      fontFamily: "LatoRegular"
                    ) :
                    Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(
                      color: const Color
                          .fromARGB(
                          255, 128, 131, 163),
                      fontSize: 12,
                        fontFamily: "LatoRegular"
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}