import 'package:flutter/material.dart';

import '../../../../../common/widgets/login/text_form_field.dart';
import '../../../../../utils/constants/colors.dart';
class InformationGenerale extends StatefulWidget {
  const InformationGenerale({super.key});

  @override
  State<InformationGenerale> createState() => _InformationGeneraleState();
}

class _InformationGeneraleState extends State<InformationGenerale> {
  String? gender;
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
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
    return Padding(
      padding: const EdgeInsets.all(27.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Information contact",style: Theme.of(context)
          .textTheme
          .bodySmall!
          .copyWith(
          color: TColors.title,
          fontSize: 14,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Row(
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
              TextFormFieldWidget(label: "Nom prénom",icon: Icons.person,hintext:"Entrer votre nom",width: 505,color: TColors.txtbouttongreydark,),
            ],
          ),
          SizedBox(height: 10,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormFieldWidget(label: "Civilité",icon: Icons.person,hintext:"Enter your name",width: 505,color: TColors.txtbouttongreydark,),
              TextFormFieldWidget(label: "Nom prénom",icon: Icons.person,hintext:"Entrer votre nom",width: 505,color: TColors.txtbouttongreydark,),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Row(
                  //mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Date naissance",style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                            color: TColors.subtitle,
                            fontSize: 13),),
                        Container(
                         // color: Colors.red,
                          width: 505,
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
                  ],
                ),
              ),
             // TextFormFieldWidget(label: "Civilité",icon: Icons.person,hintext:"Enter your name",width: 505,color: TColors.txtbouttongreydark,),
              Container(
                width: 505,
                //color: Colors.red,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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

              //TextFormFieldWidget(label: "Nom prénom",icon: Icons.person,hintext:"Entrer votre nom",width: 505,color: TColors.txtbouttongreydark,),
            ],
          ),
          SizedBox(height: 60,),

          Text("Adresse",style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(
              color: TColors.title,
              fontSize: 14,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormFieldWidget(label: "Adresse",icon: Icons.person,hintext:"Enter l'adresse",width: 505,color: TColors.txtbouttongreydark,),
              TextFormFieldWidget(label: "Complément",icon: Icons.person,hintext:"Entrer le complément d'adrese",width: 505,color: TColors.txtbouttongreydark,),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormFieldWidget(label: "Adresse",icon: Icons.person,hintext:"Enter l'adresse",width: 250,color: TColors.txtbouttongreydark,),
                  TextFormFieldWidget(label: "Adresse",icon: Icons.person,hintext:"Enter l'adresse",width: 250,color: TColors.txtbouttongreydark,),
                ],
              ),
              TextFormFieldWidget(label: "Complément",icon: Icons.person,hintext:"Entrer le complément d'adrese",width: 505,color: TColors.txtbouttongreydark,),
            ],
          ),
        ],
      ),
    );
  }
}
