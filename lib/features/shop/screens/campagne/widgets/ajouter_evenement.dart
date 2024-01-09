
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
class AjouterEvenement extends StatelessWidget {
  const AjouterEvenement({
    super.key, required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height - 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/add_meeting.png',
                width: 200,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Aucun événement ?",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(
                    fontFamily: "LatoBold",
                    fontSize: 24,color: TColors.title),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Créez votre première campagne ",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                    color: TColors.txtbouttongreydark,
                    fontSize: 12, fontFamily: "LatoRegular"),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:
                  const Color.fromARGB(255, 107, 89, 204),
                ),
                child: TextButton(
                  onPressed: onPressed,
                  child: Text(
                    "Nouveau",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white,fontFamily: "LatoBold"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
