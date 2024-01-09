
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
class Or extends StatelessWidget {
  const Or({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 192,
      height: 21,
      color: TColors.white,
      child:  Row(
          children: <Widget>[
            const Expanded(
                child: Divider(
                  thickness: 0,
                  color: Color.fromARGB(255, 238, 238, 238),
                  //indent: 25.0,
                  endIndent: 15.0,
                )
            ),

            Text("Or",style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 12, color: TColors.subtitle),),

            const Expanded(
                child: Divider(
                  thickness: 0,
                  color: Color.fromARGB(255, 238, 238, 238),
                  indent: 15.0,
                  //endIndent: 25.0,
                )
            ),
          ]
      )
    );
  }
}
