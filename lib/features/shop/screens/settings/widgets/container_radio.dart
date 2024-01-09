
import 'package:ditel_sms_app/features/shop/screens/settings/widgets/text_radio.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
class ContainerRadio extends StatefulWidget {
   ContainerRadio({super.key, required this.text1, required this.text2, this.text3, required this.trois, required this.groupeValue, required this.text, });
  final String text1;
  final String text2;
  final String? text3;
  final bool trois;
  final String text;
  late  String? groupeValue;

  @override
  State<ContainerRadio> createState() => _ContainerRadioState();
}

class _ContainerRadioState extends State<ContainerRadio> {
  late String? groupe = widget.groupeValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          child: Text(
            widget.text,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(
                color: TColors.subtitle,
                fontFamily: "LatoRegular",
                fontSize: 14),
          ),
        ),
        const SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            width: 304,
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: TColors.txtbouttongrey,
                ),
                borderRadius: BorderRadius.circular(8),
                color: TColors.bg
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250,
                  height: 80,
                  //color: Colors.red,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: RadioListTile(
                          title: TextRadio(text: widget.text1,),
                          value: widget.text1,
                          groupValue: widget.groupeValue,
                          onChanged: (value){
                            setState(() {
                              widget.groupeValue = value.toString();
                            });
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RadioListTile(
                          title: TextRadio(text: widget.text2,),
                          value: widget.text2,
                          groupValue: widget.groupeValue,
                          onChanged: (value){
                            setState(() {
                              widget.groupeValue = value.toString();
                            });
                          },
                        ),
                      ),
                      widget.trois ?
                      Expanded(
                        flex: 1,
                        child: RadioListTile(
                          title: TextRadio(text: widget.text3!,),
                          value: widget.text3,
                          groupValue: widget.groupeValue,
                          onChanged: (value){
                            setState(() {
                              widget.groupeValue = value.toString();
                            });
                          },
                        ),
                      ) : const Expanded(
                        flex: 1,
                          child: Text(''))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


