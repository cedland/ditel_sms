import 'dart:typed_data';
import 'package:ditel_sms_app/features/shop/screens/campagne/widgets/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../common/widgets/login/text_form_field.dart';
import '../../../../../data/dummy_data.dart';
import '../../../../../utils/constants/colors.dart';
import '../../contacts/widgets/boutton_contact.dart';
import '../../dashboard/widgets/top_user.dart';
import 'boutton_campagne.dart';
import 'contact_campagne.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_app_file/open_app_file.dart';


class RedigerMessage extends StatefulWidget {
  const RedigerMessage({
    super.key,
  });

  @override
  State<RedigerMessage> createState() => _RedigerMessageState();
}

class _RedigerMessageState extends State<RedigerMessage> {
  String dropdownvalue = 'Sélection groupe';
  String eventName = 'Promo -15%';
  String eventDescription = 'Campagne promotion -15% sur total commande';

  // List of items in our dropdown menu
  var items = [
    'Sélection groupe',
    'Groupe 1',
    'Groupe 2',
    'Groupe 3',
  ];
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  TimeOfDay selectedTime = TimeOfDay.now();
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }
  FilePickerResult? result;


  PlatformFile? _imagePicker;
  void openPromoWidgetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(8),
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.width / 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      eventName,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                          color: TColors.title,
                          fontSize: 14,fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(8),
                          border: Border.all(width: 0.1)),
                      child: IconButton(
                        icon: const Icon(Icons.close, size: 18),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Résumé",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                          color: TColors.subtitle,
                          fontSize: 13),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(eventDescription,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                          color: TColors.title,
                          fontSize: 13),)
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                color: TColors.subtitle,
                                fontSize: 13),
                          ),
                          SizedBox(
                            width: 220,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(DateFormat.yMMMEd().format(selectedDate)),
                                //Text("${selectedDate.toLocal()}".split(' ')[0]),
                                IconButton(onPressed: (){_selectDate(context);
                                }, icon: const Icon(Icons.calendar_month,size: 22,color: TColors.txtbouttongreydark,),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Début",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                color: TColors.subtitle,
                                fontSize: 13),
                          ),
                          SizedBox(
                            // color: Colors.red,
                            width: 209,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(selectedTime.format(context)),
                                IconButton(onPressed: (){_selectTime(context);
                                }, icon: const Icon(Icons.alarm,size: 22,),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Contacts",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                color: TColors.subtitle,
                                fontSize: 13),
                          ),
                         SizedBox(
                            width: 220,
                            height: 52,
                            //color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: 180,
                                    height: 52,
                                    //color: Colors.green,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12)
                                    ),
                                    child:  Row(
                                      children: [
                                        Expanded(
                                          child: ListView.builder(
                                            //physics: NeverScrollableScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount: contacts.length,
                                            itemBuilder:
                                                (context, index) {
                                              return InkWell(
                                                onTap: () {},
                                                child: RoundedImage(
                                                    contact:
                                                    contacts[index]),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.grey.shade100,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                      color: TColors.bg
                                    ),
                                      child: Center(child: IconButton(onPressed: (){}, icon: const Icon(Icons.share,size: 16,color: TColors.txtbouttongreydark,),))),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 100,
                      height: 72,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nb contacts",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                color: TColors.subtitle,
                                fontSize: 13),
                          ),
                          const SizedBox(height: 22,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("1302",style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                  color: TColors.title,
                                  fontSize: 14,fontWeight: FontWeight.bold),),
                              const Icon(Icons.group, color: TColors.title,size: 20,)
                            ],
                          )
                        ],
                      ),
                    ),

                  ],
                ),

                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 246, 246, 246),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Annuler",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                              color: const Color.fromARGB(
                                  255, 128, 131, 163)),
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 107, 89, 204),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Valider",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height - 80,
          width: 800,
          color: TColors.bg,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "Rédiger message",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                         fontFamily: "LatoBold",
                      fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    width: 700,
                    height: 349,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade200,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Container(
                            child: Text(
                              "Hello, #Name# ! Enjoy -15% discount on your next order  ! Visit our website Order today and be delivered #Deliverydate#  ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                  fontSize: 13,
                              fontFamily: "LatoRegular"),
                            ),
                          ),
                        ),
                        const Spacer(),
                        if(_imagePicker != null)
                        SizedBox(
                          //height: 150,
                          width: 700,
                          //color: Colors.red,
                          child:
                          Image.memory(Uint8List.fromList(_imagePicker!.bytes!),width: 60,height: 60,)
                        ),
                        if(_imagePicker == null)
                          const SizedBox(
                              height: 150,
                              width: 700,
                              //color: Colors.red,
                              child:Text('')
                          ),
                        const Spacer(),
                        SizedBox(
                          width: 700,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 28.0,bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(Icons.face, color: TColors.txtbouttongreydark,size: 26,),
                                const SizedBox(width: 10,),
                                GestureDetector(
                                  onTap: () async{
                                    try{
                                      FilePickerResult? resultat = await FilePicker.platform.pickFiles(
                                          type: FileType.image
                                      ) ;
                                      if(resultat == null) return;

                                      setState(() {
                                        _imagePicker = resultat.files.first;

                                      });

                                    }catch(e){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                                    }
                                  },
                                  child: Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: TColors.txtbouttongrey,
                                    ),
                                    child: const Icon(Icons.upload_file,size: 26,color:TColors.txtbouttongreydark,),

                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                ],
              ),

              BouttonCampagne(onPressed1: () {}, onPressed2: () {openPromoWidgetDialog(context);}, text1: 'Prédécent', text2: 'Suivant',)

            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: Container(
            height: double.infinity,
            width: 295,
            decoration:const BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 1,
                  color: TColors.txtbouttongrey
                )
              )
            ) ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 22.0),
                  child: Text('Liste shortcodes',style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                      fontFamily: "LatoBold",
                      fontSize: 16,
                  color: TColors.title),),
                ),
              ],
            ),

          ),
        )
      ],
    );
  }
}