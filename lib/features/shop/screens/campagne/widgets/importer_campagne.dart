
import 'dart:convert';
import 'dart:io';

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
import 'package:csv/csv.dart';


class ImporterCampagne extends StatefulWidget {
  ImporterCampagne({super.key,});

  TextEditingController nomController = TextEditingController();
  TextEditingController nom1Controller = TextEditingController();
  TextEditingController resumeController = TextEditingController();

  @override
  State<ImporterCampagne> createState() => _ImporterCampagneState();
}

class _ImporterCampagneState extends State<ImporterCampagne> {
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

  String initial ="";
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
                    SizedBox(
                      width: 102,
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
                                              child: RoundedImage(image: ''),
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
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height - 80,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Importer campagne",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                        fontFamily: "LatoBold", fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormFieldWidget(label: "Nom campagne",icon: Icons.camera,hintext:"Entrer le nom de la campagne",width: 505,color: TColors.txtbouttongreydark,controller: widget.nomController,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3.0),
                        child: Container(
                          width:505,
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 3.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Date campagne",style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                        color: TColors.subtitle,
                                        fontSize: 14, fontFamily: "LatoRegular"),),
                                    SizedBox(
                                      // color: Colors.red,
                                      width: 220,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("${selectedDate.toLocal()}".split(' ')[0]),
                                          IconButton(onPressed: (){_selectDate(context);
                                          }, icon: const Icon(Icons.calendar_month,size: 22,),)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Heure campagne",style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                        color: TColors.subtitle,
                                        fontSize: 14, fontFamily: "LatoRegular"),),
                                    SizedBox(
                                      // color: Colors.red,
                                      width: 220,
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
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //TextFormFieldWidget(label: "Civilité",icon: Icons.person,hintext:"Enter your name",width: 505,color: TColors.txtbouttongreydark,),
                      TextFormFieldWidget(label: "Résumé campagne",icon: Icons.edit,hintext:"Entrer le résumé de la campagne",width: 1060,color: TColors.txtbouttongreydark,controller: widget.resumeController,),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 30,
            ),
            //Container(color:Colors.blue, width:50, height:50,child: Text(initial)),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SizedBox(
                      width: 505,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: Text("Ajouter fichiers destinataires (XLS, CSV) ",style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                    color: TColors.subtitle,
                                    fontSize: 13, fontFamily: "LatoRegular"),),
                              ),
                              if (result != null)
                                Container(
                                  width: 400,
                                  height: 35,
                                  color: TColors.bg,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ListView.separated(
                                          shrinkWrap: true,
                                          itemCount: result?.files.length ?? 0,
                                          itemBuilder: (context, index) {
                                            return Text(result?.files[index].name ?? '',
                                                style:
                                                Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                    color: TColors.title,
                                                    fontSize: 14, fontWeight: FontWeight.bold));
                                          }, separatorBuilder: (BuildContext context, int index) {
                                          return const SizedBox(height: 5,);
                                        },)
                                      ],
                                    ),
                                  ),
                                ),
                              if (result == null)
                                Text("Sélection fichier",style:
                                Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                    color: TColors.title,
                                    fontSize: 14, fontFamily: "LatoBold"),)
                            ],
                          ),
                          GestureDetector(
                            onTap: () async{
                              //FilePickerResult? csvFile = await FilePicker.platform.pickFiles(allowMultiple: false,type: FileType.custom, allowedExtensions: ['csv'],);
                              FilePickerResult? csvFile = await FilePicker.platform.pickFiles(allowMultiple: false,type: FileType.custom, allowedExtensions: ['csv'],);
                              if(csvFile != null){
                                //decode bytes back to utf8
                                //final bytes = csvFile!.files[0].bytes;
                                final bytes = utf8.decode(csvFile!.files[0].bytes as List<int>);
                                //String? convertvalue= jsonEncode(bytes);
                                //List<List<dynamic>> rowsAsListOfValues  = const  CsvToListConverter().convert(convertvalue);
                                List<List<dynamic>> rowsAsListOfValues  = const  CsvToListConverter().convert(bytes);
                                //print(csvFile!.files[0].name);
                                //print(rowsAsListOfValues.length);
                                for(int i = 0; i <rowsAsListOfValues.length; i++)
                                  {
                                    for (int j = 0; j < rowsAsListOfValues.elementAt(i).length; j++)
                                      {
                                        setState(() {
                                          widget.nomController.text = rowsAsListOfValues.elementAt(i).elementAt(0);
                                        });
                                      }
                                  }
                              }
                            },
                            /*onTap: () async{
                              result =
                              await FilePicker.platform.pickFiles(allowMultiple: false,type: FileType.custom,
                                allowedExtensions: ['csv'],);
                              if (result == null) {
                                print("No file selected");
                              } else {
                                setState(() {});
                                for (var element in result!.files) {
                                  print(element.name);
                                  print(element.bytes);
                                }
                              }
                            },*/
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: TColors.bg,
                                    width: 1
                                ),
                                borderRadius: BorderRadius.circular(8),
                                color: TColors.txtbouttongrey,
                              ),
                              child: const Icon(Icons.more_horiz,size: 18,color: TColors.bgboutton,),

                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BouttonCampagne(onPressed1: () {}, onPressed2: () {openPromoWidgetDialog(context);}, text1: 'Annuler', text2: 'Suivant',)
          ],
        ),
      ),
    );
  }
}