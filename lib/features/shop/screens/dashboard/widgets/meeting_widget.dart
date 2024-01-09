import 'package:flutter/material.dart';
import 'package:ditel_sms_app/classes/event.dart';

import '../../../../../utils/constants/colors.dart';

class MeetingWidget extends StatelessWidget {
  const MeetingWidget({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color.fromARGB(100, 158, 158, 158),
                width: 0.5,
              ),
            ),
            child: const Icon(
              Icons.access_time,
              color: Color.fromARGB(255, 128, 131, 163),
            ),
          ),
          const SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${event.date.month} / ${event.date.day}",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 14,color: TColors.title,fontFamily: "LatoBold"),
              ),
              const SizedBox(height: 4,),
              Text(
                "${event.date.hour.toString()} : 00",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: TColors.txtbouttongreydark,
                    fontSize: 12,fontFamily: "LatoRegular"),
              ),
            ],
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(event.title,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: TColors.title,fontSize: 14,fontFamily: "LatoRegular")),
                const SizedBox(
                  height: 4,
                ),
                Text(event.type,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: TColors.txtbouttongreydark,
                        fontSize: 12, fontFamily: "LatoRegular")),
              ],
            ),
          ),
          const SizedBox(width: 16.0),
         /* Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(event.image,fit: BoxFit.fill,width: 40,height: 40,),
            ),
          )*/

        ],
      ),
    );
  }
}
