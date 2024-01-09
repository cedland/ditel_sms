import 'package:flutter/material.dart';
class BouttonContact extends StatelessWidget {
  const BouttonContact({
    super.key, required this.onPressed1, required this.onPressed2
  });
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0,left: 30,right: 30),
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
                    "Enregistrer",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                        color: Colors.white),
                  ),
                ),
              ),
              const Spacer(),
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
                          255, 128, 131, 163),
                    ),
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