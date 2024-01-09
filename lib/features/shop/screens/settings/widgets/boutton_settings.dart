
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
class BouttonSetting extends StatelessWidget {
  const BouttonSetting({
    super.key, required this.onPressed1, required this.onPressed2
  });
  final void Function() onPressed1;
  final void Function() onPressed2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4.0,left: 15,right: 15),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Container(
                width: 200,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(8),
                  color: const Color.fromARGB(
                      255, 107, 89, 204),
                ),
                child: TextButton(
                  onPressed: onPressed1,
                  child: Text(
                    "Sauvegarder",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                        color: Colors.white,fontFamily: "LatoBold"),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(
                        255, 236, 238, 245),
                  ),
                  borderRadius:
                  BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: TextButton(
                  onPressed: onPressed2,
                  child: Text(
                    "Annuler",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                      color: const Color
                          .fromARGB(
                          255, 128, 131, 163,),
                      fontFamily: "LatoBold"
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: 180,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(
                        255, 236, 238, 245),
                  ),
                  borderRadius:
                  BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: TextButton(
                  onPressed: onPressed2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.delete_forever_rounded,color: TColors.txtbouttongreydark,),
                      Text(
                        "Supprimer compte",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                          color: const Color
                              .fromARGB(
                              255, 128, 131, 163),
                          fontFamily: "LatoBold"
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}