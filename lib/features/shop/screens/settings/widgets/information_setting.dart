import 'package:flutter/material.dart';

import '../../../../../common/widgets/login/text_form_field.dart';
import '../../../../../utils/constants/colors.dart';
import '../../contacts/widgets/boutton_contact.dart';
import 'boutton_settings.dart';

class InformationSetting extends StatefulWidget {
  InformationSetting({super.key,});

  TextEditingController nomController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  TextEditingController complementController = TextEditingController();
  TextEditingController cpController = TextEditingController();
  TextEditingController villeController = TextEditingController();
  TextEditingController nom2Controller = TextEditingController();
  TextEditingController tel2Controller = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  State<InformationSetting> createState() => _InformationSettingState();
}

class _InformationSettingState extends State<InformationSetting> {
  String? gender;
  String dropdownvalue = 'Sélection groupe';

  // List of items in our dropdown menu
  var items = [
    'Sélection groupe',
    'Groupe 1',
    'Groupe 2',
    'Groupe 3',
  ];
  String dropdownvalue2 = 'Sélection pays';

  // List of items in our dropdown menu
  var pays = [
    'Sélection pays',
    'France',
    'Angleterre',
    'Suisse',
    'Moldavie',
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
                    "Information entreprise",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                        fontFamily: "LatoBold"),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormFieldWidget(label: "Nom entreprise",icon: Icons.domain,hintext:"Entrer le nom de l'entreprise",width: 505,color: TColors.txtbouttongreydark,controller: widget.nomController,),

                      TextFormFieldWidget(label: "Téléphone entreprise",icon: Icons.phone,hintext:"Entrer téléphone de l'entreprise",width: 505,color: TColors.txtbouttongreydark,controller: widget.telController,),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormFieldWidget(label: "Addresse",icon: Icons.location_on,hintext:"Entrer l'adresse",width: 505,color: TColors.txtbouttongreydark,controller: widget.adresseController,),
                      TextFormFieldWidget(label: "Complément",icon: Icons.location_on,hintext:"Entrer le complément d'adresse",width: 505,color: TColors.txtbouttongreydark,controller: widget.complementController),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width:505,
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextFormFieldWidget(label: "Code postal",icon: Icons.location_on,hintext:"Entrer votre cp",width: 230,color: TColors.txtbouttongreydark,controller: widget.cpController,),
                              TextFormFieldWidget(label: "Ville",icon: Icons.location_on,hintext:"Entrer votre ville",width: 230,color: TColors.txtbouttongreydark,controller: widget.villeController,),
                            ],
                          ),
                        ),
                      ),
                      //TextFormFieldWidget(label: "Complément",icon: Icons.person,hintext:"Entrer le complément d'adrese",width: 505,color: TColors.txtbouttongreydark,),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: SizedBox(
                          width: 505,
                          height: 52,
                          //color: Colors.red,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Pays",style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                    color: TColors.subtitle,
                                    fontSize: 13,
                                fontFamily: "LatoRegular"),),
                                const SizedBox(height: 4,),
                                SizedBox(
                                  //color: Colors.green,
                                  height: 30,
                                  child: DropdownButton(
                                    // Initial Value
                                    value: dropdownvalue2,
                                    isExpanded: true,
                                    focusColor: TColors.bg,
                                    // Down Arrow Icon
                                    icon: const Icon(Icons.keyboard_arrow_down),

                                    // Array list of items
                                    items: pays.map((String pays) {
                                      return DropdownMenuItem(
                                        value: pays,
                                        child: Text(pays),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue2 = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Information contact",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                       fontFamily: "LatoBold"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //TextFormFieldWidget(label: "Civilité",icon: Icons.person,hintext:"Enter your name",width: 505,color: TColors.txtbouttongreydark,),
                      Container(
                        width: 300,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text("Civilité",style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                  color: TColors.subtitle,
                                  fontSize: 13),),
                            ),
                            Expanded(
                              flex: 1,
                              child: RadioListTile(
                                title: Text("Mme"),
                                value: "Mme",
                                groupValue: gender,
                                onChanged: (value){
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child:  RadioListTile(
                                title: Text("Mr"),
                                value: "Mr",
                                groupValue: gender,
                                onChanged: (value){
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextFormFieldWidget(label: "Nom prénom",icon: Icons.person,hintext:"Entrer votre nom",width: 505,color: TColors.txtbouttongreydark,controller: widget.nom2Controller,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormFieldWidget(label: "Email",icon: Icons.email,hintext:"Entrer l'email",width: 505,color: TColors.txtbouttongreydark,controller: widget.emailController,),
                      TextFormFieldWidget(label: "Téléphone contact",icon: Icons.phone,hintext:"Entrer le téléphone du contact",width: 505,color: TColors.txtbouttongreydark,controller: widget.tel2Controller,),
                    ],
                  ),
                ),

              ],
            ),
            BouttonSetting(onPressed1: () {}, onPressed2: () {})
          ],
        ),
      ),
    );
  }
}

