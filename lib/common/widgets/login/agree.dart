
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
class AgreeWidget extends StatefulWidget {
  const AgreeWidget({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  State<AgreeWidget> createState() => _AgreeWidgetState();
}

class _AgreeWidgetState extends State<AgreeWidget> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: TColors.white,
      //width: 212,
      height: 20,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                rememberMe = !rememberMe;
              });
            },
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: rememberMe
                      ? TColors.colorCheckbox
                      : Colors.grey,
                ),
              ),
              child: rememberMe
                  ? Center(
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: TColors.bgboutton
                  ),
                ),
              )
                  : null,
            ),
          ),
          const SizedBox(width: 8),
       Text(widget.text,style: Theme.of(context).textTheme.bodySmall!.copyWith(
           fontSize: 14,
           color: widget.color,fontWeight: FontWeight.w400,fontFamily: "LatoBold"))
        ],
      ),
    );
  }
}
