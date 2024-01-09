import 'package:flutter/material.dart';
class BouttonCampagne extends StatelessWidget {
  const BouttonCampagne({
    super.key, required this.onPressed1, required this.onPressed2, required this.text1, required this.text2
  });
  final void Function() onPressed1;
  final void Function() onPressed2;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0,left: 30,right: 30),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
                  onPressed: onPressed1,
                  child: Text(
                    text1,
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
                ),
              ),
              const SizedBox(width: 34,),
              Container(
                width: 120,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(8),
                  color: const Color.fromARGB(
                      255, 107, 89, 204),
                ),
                child: TextButton(
                  onPressed: onPressed2,
                  child: Text(
                    text2,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                        color: Colors.white,
                      fontFamily: "LatoBold"
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