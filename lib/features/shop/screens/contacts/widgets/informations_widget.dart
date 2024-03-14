import 'package:flutter/material.dart';

import '../../../../../common/widgets/login/text_form_field.dart';
import '../../../../../utils/constants/colors.dart';
import 'add_contact_field.dart';
import 'boutton_contact.dart';
import 'package:image_picker/image_picker.dart';

import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
class Informations extends StatefulWidget {
  Informations({super.key,});

  TextEditingController nomController = TextEditingController();
  TextEditingController entrepriseController = TextEditingController();
  TextEditingController fonctionController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  TextEditingController complementController = TextEditingController();
  TextEditingController cpController = TextEditingController();
  TextEditingController villeController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  State<Informations> createState() => _InformationsState();
}

class _InformationsState extends State<Informations> {
  PlatformFile? _imageFile;


  Future<void> _pickImage() async {
    try {
      // Pick an image file using file_picker package
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      // If user cancels the picker, do nothing
      if (result == null) return;

      // If user picks an image, update the state with the new image file
      setState(() {
        _imageFile = result.files.first;
      });
    } catch (e) {
      // If there is an error, show a snackbar with the error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }
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
                    "Information contact",
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
                      TextFormFieldWidget(label: "Nom prénom",icon: Icons.person,hintext:"Entrer votre nom",width: 505,color: TColors.txtbouttongreydark,controller: widget.nomController,),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormFieldWidget(label: "Entreprise",icon: Icons.domain,hintext:"Entrer votre entreprise",width: 505,color: TColors.txtbouttongreydark,controller: widget.entrepriseController),
                      TextFormFieldWidget(label: "Fonction",icon: Icons.record_voice_over_rounded,hintext:"Entrer votre fonction",width: 505,color: TColors.txtbouttongreydark,controller: widget.fonctionController),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Row(
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
                            Container(
                              width: 505,
                              //color: Colors.red,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text("Groupes clients",style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                          color: TColors.subtitle,
                                          fontSize: 13),),
                                    ),
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
                          ],
                        ),
                      ),
                      Container(
                        width: 505,
                        height: 120,
                        //color: Colors.red,
                        child:  Center(
                          child: Stack(
                            children: <Widget>[
                              _imageFile == null ?
                              const CircleAvatar(
                                radius: 80.0,
                                backgroundImage:
                                AssetImage("assets/images/profile.png")
                              ) : CircleAvatar(
                                radius: 80.0,
                                child: ClipOval(
                                  child: Image.memory(
                                    Uint8List.fromList(_imageFile!.bytes!),
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: 10,
                                  right: 38,
                                  child: InkWell(
                                    onTap: (){_pickImage();},
                                    child: const Icon(
                                      Icons.camera_alt,
                                      color: Colors.black,
                                      size: 28.0,
                                    ),
                                  ))

                            ],
                          ),
                        ),
                      )
                      // TextFormFieldWidget(label: "Civilité",icon: Icons.person,hintext:"Enter your name",width: 505,color: TColors.txtbouttongreydark,),

                      //TextFormFieldWidget(label: "Nom prénom",icon: Icons.person,hintext:"Entrer votre nom",width: 505,color: TColors.txtbouttongreydark,),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Adresse",
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
                      TextFormFieldWidget(label: "Adresse",icon: Icons.location_on,hintext:"Enter l'adresse",width: 505,color: TColors.txtbouttongreydark,controller: widget.adresseController),
                      TextFormFieldWidget(label: "Complément",icon: Icons.location_on ,hintext:"Entrer le complément d'adrese",width: 505,color: TColors.txtbouttongreydark,controller: widget.complementController),
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
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          width:505,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextFormFieldWidget(label: "Code postal",icon: Icons.location_on,hintext:"Entrer votre cp",width: 230,color: TColors.txtbouttongreydark,controller: widget.cpController),
                              TextFormFieldWidget(label: "Ville",icon: Icons.location_on,hintext:"Entrer votre ville",width: 230,color: TColors.txtbouttongreydark,controller: widget.villeController),
                            ],
                          ),
                        ),
                      ),
                      //TextFormFieldWidget(label: "Complément",icon: Icons.person,hintext:"Entrer le complément d'adrese",width: 505,color: TColors.txtbouttongreydark,),
                      Container(
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            BouttonContact(onPressed1: () {
            }, onPressed2: () {Navigator.pop(context);}, text: 'Enregistrer',)
          ],
        ),
      ),
    );
  }
  /*void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }*/

}

