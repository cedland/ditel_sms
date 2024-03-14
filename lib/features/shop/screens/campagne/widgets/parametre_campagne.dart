import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/login/text_form_field.dart';
import '../../../../../data/dummy_data.dart';
import '../../../../../utils/constants/colors.dart';
import '../../contacts/widgets/boutton_contact.dart';
import '../../dashboard/widgets/top_user.dart';
import 'boutton_campagne.dart';
import 'contact_campagne.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_app_file/open_app_file.dart';
import 'package:http/http.dart' as http;


class ParametreCampagne extends StatefulWidget {
  ParametreCampagne({super.key,});
  TextEditingController nomController = TextEditingController();
  TextEditingController resumeController = TextEditingController();
  @override
  State<ParametreCampagne> createState() => _ParametreCampagneState();
}

class _ParametreCampagneState extends State<ParametreCampagne> {
  List dataGroupe = [];
  String? selectedGroupe;

  List contactdata=[];
  final formKey = GlobalKey<FormState>();


  Future<void>getContact() async{
    String uri = "http://192.168.0.109/ditel_sms_php/get_groupe_contact.php";
    try{
      //var response = await http.post(Uri.parse(uri),headers: {"Accept":"application/json"},body: {"groupe_nom":selectedGroupe ?? "[]"});
      var response = await http.post(Uri.parse(uri),headers: {"Accept":"application/json"},body: {"groupe_nom":selectedGroupe});
      setState(() {
        contactdata = jsonDecode(response.body);
      });
    }
    catch(e){print(e);}
  }

  Future getGroupe() async{
    String uri = "http://192.168.0.109/ditel_sms_php/get_all_groupe.php";
    var response = await http.post(Uri.parse(uri),headers: {"Accept":"application/json"});
    var jsonBody = response.body;
    var jsonData = json.decode(jsonBody);
    setState(() {
      dataGroupe = jsonData;
    });
    return "success";
  }
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    selectedDate = DateTime.now();
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

  @override
  void initState() {
    getGroupe();
    //getContact();
    super.initState();
  }

  /*PlatformFile? file;
  Future<void> picksinglefile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.first;
      file == null ? false : OpenAppFile.open(file!.path.toString());
    }
  }*/


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Expanded(
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
                      "Paramètres campagne",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                        fontSize: 16,
                        fontFamily: "LatoBold"
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormFieldWidget(label: "Nom campagne",icon: Icons.camera,hintext:"Entrer le nom de la campagne",width: 505,color: TColors.txtbouttongreydark,controller: widget.nomController,),
                        SizedBox(
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
                                        fontSize: 13,
                                    fontFamily: "LatoRegular"),),
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
                                        fontSize: 13,
                                    fontFamily: "LatoRegular"),),
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
                      ],
                    ),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "Contacts",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                          color: TColors.subtitle,
                          fontSize: 16,
                        fontFamily: "LatoRegular"
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      color: TColors.bg,
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: contactdata.length,
                              itemBuilder:
                                  (context, index) {
                                return InkWell(
                                  onTap: () {},
                                  //child:selectedGroupe == null ? Text("mama"):Text("papa")
                                  child: ContactCampagne(image: contactdata[index]["image"], name: contactdata[index]["nom_prenom"], ontap: () {  },),
                                );
                              },
                            ),
                          ),
                        ],
                      ),

                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                                  fontSize: 13,
                              fontFamily: "LatoRegular"),),
                            ),
                            DropdownButton(
                              // Initial Value
                              value: selectedGroupe,
                              hint: const Text("Sélectionner un groupe"),
                              isExpanded: true,
                              focusColor: TColors.bg,
                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: dataGroupe.map((list) {
                                return DropdownMenuItem(
                                  value: list['id'].toString(),
                                  child: Text(list['nom_groupe']),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (value) {
                                setState(() {
                                  selectedGroupe = value;
                                  getContact();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

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
                                      fontSize: 13,
                                      fontFamily: "LatoRegular"),),
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
                                      fontSize: 14, fontFamily: "LatoRegular"),)
                              ],
                            ),
                            GestureDetector(
                              onTap: () async{
                                result =
                                await FilePicker.platform.pickFiles(allowMultiple: true);
                                if (result == null) {
                                  print("No file selected");
                                } else {
                                  setState(() {});
                                  for (var element in result!.files) {
                                    print(element.name);
                                  }
                                }
                              },
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
              BouttonCampagne(onPressed1: () {Get.back();}, onPressed2:(){}, text1: 'Annuler', text2: 'Suivant',)
            ],
          ),
        ),
      ),
    );
  }
}