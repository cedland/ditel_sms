import 'package:flutter/material.dart';

import '../../../../../common/widgets/login/text_form_field.dart';
import '../../../../../utils/constants/colors.dart';
import 'add_contact_field.dart';
import 'boutton_contact.dart';
class ContactWidgetContact extends StatefulWidget {
  ContactWidgetContact({super.key,});

  TextEditingController emailController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController lien1Controller = TextEditingController();
  TextEditingController lien2Controller = TextEditingController();
  TextEditingController lien3Controller = TextEditingController();
  TextEditingController lien4Controller = TextEditingController();

  @override
  State<ContactWidgetContact> createState() => _ContactWidgetContactState();
}

class _ContactWidgetContactState extends State<ContactWidgetContact> {
  String dropdownvalue = 'Choisir réseau social';

  // List of items in our dropdown menu
  var items = [
    'Choisir réseau social',
    'Facebook',
    'Whatsapp',
    'Instagram',
  ];
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
                    "Email & Tel",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                        fontWeight:
                        FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //TextFormFieldWidget(label: "Civilité",icon: Icons.person,hintext:"Enter your name",width: 505,color: TColors.txtbouttongreydark,),
                      TextFormFieldWidget(label: "Email",icon: Icons.email,hintext:"Entrer email",width: 505,color: TColors.txtbouttongreydark,controller: widget.emailController,),
                      Padding(
                        padding: const EdgeInsets.only(left: 58.0),
                        child: Container(
                          child: Row(children: [
                            const Icon(
                              Icons.add_circle,
                              color: Color.fromARGB(255, 128, 131, 163), size: 18,),
                            const SizedBox(width: 20,),
                            Text("Ajouter email", style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                color: TColors.subtitle,
                                fontSize: 13),),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //TextFormFieldWidget(label: "Civilité",icon: Icons.person,hintext:"Enter your name",width: 505,color: TColors.txtbouttongreydark,),
                      TextFormFieldWidget(label: "Tel",icon: Icons.phone,hintext:"Entrer numéro tél",width: 505,color: TColors.txtbouttongreydark,controller: widget.telController,),
                      Padding(
                        padding: const EdgeInsets.only(left: 58.0),
                        child: Container(
                          child: Row(children: [
                            const Icon(
                              Icons.add_circle,
                              color: Color.fromARGB(255, 128, 131, 163), size: 18,),
                            const SizedBox(width: 20,),
                            Text("Ajouter un numéro", style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                color: TColors.subtitle,
                                fontSize: 13),),
                          ]),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Réseaux sociaux",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                        fontWeight:
                        FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //TextFormFieldWidget(label: "Complément",icon: Icons.person,hintext:"Entrer le complément d'adrese",width: 505,color: TColors.txtbouttongreydark,),
                      SizedBox(
                        width: 505,
                        //color: Colors.red,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Pays",style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                  color: TColors.subtitle,
                                  fontSize: 13),),
                              DropdownButton(

                                // Initial Value
                                value: dropdownvalue,
                                isExpanded: true,
                                focusColor: TColors.bg,
                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: TextFormFieldWidget(label: "Lien",icon: Icons.link,hintext:"Ajouter lien profil",width: 505,color: TColors.txtbouttongreydark,controller: widget.lien1Controller,),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //TextFormFieldWidget(label: "Complément",icon: Icons.person,hintext:"Entrer le complément d'adrese",width: 505,color: TColors.txtbouttongreydark,),
                      SizedBox(
                        width: 505,
                        //color: Colors.red,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Pays",style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                  color: TColors.subtitle,
                                  fontSize: 13),),
                              DropdownButton(

                                // Initial Value
                                value: dropdownvalue,
                                isExpanded: true,
                                focusColor: TColors.bg,
                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextFormFieldWidget(label: "Lien",icon: Icons.link,hintext:"Ajouter lien profil",width: 505,color: TColors.txtbouttongreydark,controller: widget.lien2Controller),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //TextFormFieldWidget(label: "Complément",icon: Icons.person,hintext:"Entrer le complément d'adrese",width: 505,color: TColors.txtbouttongreydark,),
                      SizedBox(
                        width: 505,
                        //color: Colors.red,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Pays",style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                  color: TColors.subtitle,
                                  fontSize: 13),),
                              DropdownButton(

                                // Initial Value
                                value: dropdownvalue,
                                isExpanded: true,
                                focusColor: TColors.bg,
                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextFormFieldWidget(label: "Lien",icon: Icons.link,hintext:"Ajouter lien profil",width: 505,color: TColors.txtbouttongreydark,controller: widget.lien3Controller),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //TextFormFieldWidget(label: "Complément",icon: Icons.person,hintext:"Entrer le complément d'adrese",width: 505,color: TColors.txtbouttongreydark,),
                      SizedBox(
                        width: 505,
                        //color: Colors.red,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Pays",style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                  color: TColors.subtitle,
                                  fontSize: 13),),
                              DropdownButton(

                                // Initial Value
                                value: dropdownvalue,
                                isExpanded: true,
                                focusColor: TColors.bg,
                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: TextFormFieldWidget(label: "Lien",icon: Icons.link,hintext:"Ajouter lien profil",width: 505,color: TColors.txtbouttongreydark,controller: widget.lien4Controller),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            BouttonContact(onPressed1: () {}, onPressed2: () {}, text: 'Enregistrer',)
          ],
        ),
      ),
    );
  }
}