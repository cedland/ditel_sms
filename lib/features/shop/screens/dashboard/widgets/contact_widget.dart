import 'package:flutter/material.dart';

import '../../../../../classes/contact.dart';
import '../../../../../utils/constants/colors.dart';

class ContactWidget extends StatelessWidget {
  final String image;
  final String name;
  final String fonction;
  bool connect = true;

  ContactWidget({super.key,required this.image, required this.name, required this.fonction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 9),
                child: Container(
                  width: 38,
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      image,
                      width: 36,
                      height: 36,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Image.asset('assets/images/dashboard/img1.png');
                      },
                    ),

                  ),
                ),
              ),
              Positioned(
                top: 35,
                left: 35,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(15),
                    color: TColors.bg,
                  ),
                  child: Container(
                    height: 12,
                    width: 12,
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5),
                      color: connect ? Colors.green : Colors.orange,
                    ),
                  )
                ),
              )
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name,style: Theme.of(context).textTheme.bodySmall!.copyWith(fontFamily: "LatoBold",fontSize: 14,color: TColors.title)),
                Text(fonction, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: const Color.fromARGB(255, 128, 131, 163),fontFamily: "LatoRegular",fontSize: 14),),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.zero,
            width: 30,
            height: 30,
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color.fromARGB(100, 158, 158, 158),
                width: 0.5,
              ),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz_outlined,
                size: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
