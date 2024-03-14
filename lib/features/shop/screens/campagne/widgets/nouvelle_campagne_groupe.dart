import 'dart:convert';
import 'dart:typed_data';

import 'package:csv/csv.dart';
import 'package:ditel_sms_app/features/shop/screens/campagne/widgets/rounded_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multiple_search_selection/multiple_search_selection.dart';
import '../../../../../common/widgets/login/text_form_field.dart';
import '../../../../../utils/constants/colors.dart';
import '../../dashboard/dashbord.dart';
import '../../message/widgets/container_actif_message.dart';
import 'boutton_campagne.dart';
import 'contact_campagne.dart';
import 'importer_campagne.dart';
import 'package:toastification/toastification.dart';

import 'package:http/http.dart' as http;

class NouvelleCampagneGroupe extends StatefulWidget {
  const NouvelleCampagneGroupe({
    super.key,
  });

  @override
  State<NouvelleCampagneGroupe> createState() => _NouvelleCampagneGroupeState();
}

class _NouvelleCampagneGroupeState extends State<NouvelleCampagneGroupe> {
  var pageId = 0;
  var page = 1;
  bool activation = false;
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  List dataGroupe = [];
  String? selectedGroupe;
  FilePickerResult? result;
  FilePickerResult? resultmms;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController nomCampagneController = TextEditingController();
  TextEditingController resumeController = TextEditingController();
  PlatformFile? _imagePicker;
  String? message;

  TextEditingController messageController = TextEditingController();
  late final String? validator;
  final scrollController = ScrollController();
  List contactdataremaind=[];
  List contactdata=[];
  List contact = [];
  List contactSelect = [];
  List contactalldata = [];
  List contactNom = [];
  String? nomvalue;
  List contactTel = [];
  String? telvalue;


  List contactEmail = [];
  String? emailvalue;

  Future<void> getEmail() async{
    String uri = "http://192.168.0.110/ditel_sms_app_php/get_email.php";
    try{
      //var response = await http.post(Uri.parse(uri),headers: {"Accept":"application/json"},body: {"groupe_nom":selectedGroupe ?? "[]"});
      var response = await http.post(Uri.parse(uri),headers: {"Accept":"application/json"},body: {"groupe_nom":selectedGroupe});
      setState(() {
        contactEmail = jsonDecode(response.body);
        emailvalue = contactEmail.join("");
        //print(nomvalue);
      });
    }
    catch(e){print(e);}

  }
  Future<void> getTel() async{
    String uri = "http://192.168.0.110/ditel_sms_app_php/get_tel.php";
    try{
      //var response = await http.post(Uri.parse(uri),headers: {"Accept":"application/json"},body: {"groupe_nom":selectedGroupe ?? "[]"});
      var response = await http.post(Uri.parse(uri),headers: {"Accept":"application/json"},body: {"groupe_nom":selectedGroupe});
      setState(() {
        contactTel = jsonDecode(response.body);
        telvalue = contactTel.join("");
        //print(nomvalue);
      });
    }
    catch(e){print(e);}

  }
  Future<void> getNom() async{
    String uri = "http://192.168.0.110/ditel_sms_app_php/get_nom.php";
    try{
      //var response = await http.post(Uri.parse(uri),headers: {"Accept":"application/json"},body: {"groupe_nom":selectedGroupe ?? "[]"});
      var response = await http.post(Uri.parse(uri),headers: {"Accept":"application/json"},body: {"groupe_nom":selectedGroupe});
      setState(() {
        contactNom = jsonDecode(response.body);
        nomvalue = contactNom.join("");
        //print(nomvalue);
      });
    }
    catch(e){print(e);}

  }

  void showtoast(String title, String description,Color couleur, IconData icon,ToastificationType type){
    toastification.show(
      context: context,
      type: type,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 5),
      title: Text(title),
      // you can also use RichText widget for title and description parameters
      description: RichText(text:  TextSpan(text:description)),
      alignment: Alignment.topRight,
      //direction: TextDirection.,
      animationDuration: const Duration(milliseconds: 300),
      icon: Icon(icon),
      primaryColor: couleur,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        )
      ],
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: true,
    );
  }
  Future<void>getContactRemaind() async{
    String uri = "http://192.168.0.110/ditel_sms_app_php/get_groupe_contact_remaind.php";
    try{
      //var response = await http.post(Uri.parse(uri),headers: {"Accept":"application/json"},body: {"groupe_nom":selectedGroupe ?? "[]"});
      var response = await http.post(Uri.parse(uri),headers: {"Accept":"application/json"},body: {"groupe_nom":selectedGroupe});
      setState(() {
        contactdataremaind = jsonDecode(response.body);
      });
    }
    catch(e){print(e);}
  }
  Future<void>getContact() async{
    String uri = "http://192.168.0.110/ditel_sms_app_php/get_groupe_contact.php";
    try{
      //var response = await http.post(Uri.parse(uri),headers: {"Accept":"application/json"},body: {"groupe_nom":selectedGroupe ?? "[]"});
      var response = await http.post(Uri.parse(uri),headers: {"Accept":"application/json"},body: {"groupe_nom":selectedGroupe ?? jsonEncode("")});
      setState(() {
        contactdata = jsonDecode(response.body);
        //contact =contactdata + contactSelect;
        contact = contactdata;
        //print(contactdata.length);
      });
    }
    catch(e){print(e);}
  }
  Future<void>getAllContact() async{
    String uri = "http://192.168.0.110/ditel_sms_app_php/get_contact.php";
    try{
      var response = await http.get(Uri.parse(uri));

      setState(() {
        contactalldata = jsonDecode(response.body);
      });
    }
    catch(e){print(e);}
  }

  Future getGroupe() async{
    String uri = "http://192.168.0.110/ditel_sms_app_php/get_groupe.php";
    var response = await http.post(Uri.parse(uri),headers: {"Accept":"application/json"});
    var jsonBody = response.body;
    var jsonData = json.decode(jsonBody);
    setState(() {
      dataGroupe = jsonData;
    });
    return "success";
  }
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


  @override
  void initState() {
    getAllContact();
    getGroupe();
    //getContact();
    //contact =contactdataremaind + contactSelect ;
    super.initState();
  }

  void openAllContact(BuildContext context) {
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
            height: MediaQuery.of(context).size.width / 3 +40,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ajout des contacts",
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
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.width / 4,
                  child: SingleChildScrollView(
                    child: MultipleSearchSelection(
                      showedItemsScrollController: scrollController,
                      searchField: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search contact',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      //onSearchChanged: (text) {print('Text is $text');},
                      onSearchChanged: (text) {},
                      items: contactalldata, // List<Country>
                      fieldToCheck: (c) {
                        return c["nom_prenom"]; // String
                      },
                      itemBuilder:   (contact, index) {
                        return Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20.0,
                                horizontal: 12,
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child:Image.network(contact["image"],
                                      width: 36,
                                      height: 36,
                                      errorBuilder: (BuildContext context, Object exception,
                                          StackTrace? stackTrace) {
                                        return Image.asset('assets/images/dashboard/img1.png');
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 20,),
                                  Text(contact["nom_prenom"]),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      pickedItemBuilder: (contact) {
                        return SingleChildScrollView(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey[400]!),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(contact["nom_prenom"]),
                              //child: Text("mama"),
                            ),
                          ),
                        );
                      },
                      onTapShowedItem: () {},
                      onPickedChange: (items) {
                        setState(() {
                          contactSelect = items;
                          //contact = contactdata + contactSelect;
                          //print("la nouvelle taille est: ${contact.length}");
                        });
                      },
                      onItemAdded: (item) {},
                      onItemRemoved: (item) {},
                      sortShowedItems: true,
                      sortPickedItems: true,
                      fuzzySearch: FuzzySearch.jaro,
                      itemsVisibility: ShowedItemsVisibility.alwaysOn,
                      title: const Text(
                        'Contacts',
                      ),
                      showSelectAllButton: true,
                      maximumShowItemsHeight: 220,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(child: Row(
                  children: [
                    BouttonCampagne(onPressed1: () { Navigator.of(context).pop(); }, onPressed2: () {
                      setState(() {
                        contact = contactdata + contactSelect;
                        Navigator.of(context).pop();
                        showtoast("Succès!!","${contactSelect.length} nouveaux contacts ajoutés", Colors.green, Icons.check,ToastificationType.success);
                      });
                    }, text1: 'Annuler', text2: 'Ajouter',),
                  ],
                ))
              ],
            ),
          ),


        );
      },
    );
  }

 void openRemaindContact(BuildContext context) {
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
            height: MediaQuery.of(context).size.width / 3 +40,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ajout des contacts supplémentaires",
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
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.width / 4,
                  child: SingleChildScrollView(
                    child: MultipleSearchSelection(
                      showedItemsScrollController: scrollController,
                      searchField: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search contact',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      //onSearchChanged: (text) {print('Text is $text');},
                      onSearchChanged: (text) {},
                      items: contactdataremaind, // List<Country>
                      fieldToCheck: (c) {
                        return c["nom_prenom"]; // String
                      },
                      itemBuilder:   (contact, index) {
                        return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20.0,
                                  horizontal: 12,
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child:Image.network(contact["image"],
                                        width: 36,
                                        height: 36,
                                        errorBuilder: (BuildContext context, Object exception,
                                      StackTrace? stackTrace) {
                                    return Image.asset('assets/images/dashboard/img1.png');
                                    },
                                      ),
                                    ),
                                    const SizedBox(width: 20,),
                                    Text(contact["nom_prenom"]),
                                  ],
                                ),
                              ),
                            ),
                        );
                      },
                      pickedItemBuilder: (contact) {
                        return SingleChildScrollView(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey[400]!),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(contact["nom_prenom"]),
                              //child: Text("mama"),
                            ),
                          ),
                        );
                      },
                      onTapShowedItem: () {},
                      onPickedChange: (items) {
                        setState(() {
                          contactSelect = items;
                          //contact = contactdata + contactSelect;
                          //print("la nouvelle taille est: ${contact.length}");
                        });
                      },
                      onItemAdded: (item) {},
                      onItemRemoved: (item) {},
                      sortShowedItems: true,
                      sortPickedItems: true,
                      fuzzySearch: FuzzySearch.jaro,
                      itemsVisibility: ShowedItemsVisibility.alwaysOn,
                      title: const Text(
                        'Contacts',
                      ),
                      showSelectAllButton: true,
                      maximumShowItemsHeight: 220,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
          Center(child: Row(
            children: [
              BouttonCampagne(onPressed1: () { Navigator.of(context).pop(); }, onPressed2: () {
                setState(() {
                  contact = contactdata + contactSelect;
                  Navigator.of(context).pop();
                  showtoast("Succès!!","${contactSelect.length} nouveaux contacts ajoutés", Colors.green, Icons.check,ToastificationType.success);
                });
              }, text1: 'Annuler', text2: 'Ajouter',),
            ],
          ))
              ],
            ),
              ),
          
          
        );
      },
    );
  }

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
                      nomCampagneController.text,
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
                    Text(resumeController.text,
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
                                IconButton(onPressed: (){_selectDate(context);},
                                  icon: const Icon(Icons.calendar_month,size: 22,color: TColors.txtbouttongreydark,),)
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
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount: contact.length,
                                          itemBuilder:
                                              (context, index) {
                                            return InkWell(
                                              onTap: () {},
                                              child: RoundedImage(image: contact[index]["image"]),
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
                              Text(contact.length.toString(),style: Theme.of(context)
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
                        onPressed: () {
                          Get.to(() => Dashboard(4));
                          showtoast("Error!!","Votre campagne n'a pas été créée", Colors.red, Icons.error,ToastificationType.error);},
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
                        onPressed: () {
                          //Get.to(() => Dashboard(4));
                          Navigator.of(context).pop();
                          Get.to(() => Dashboard(4));
                          showtoast("Succès!!","Votre campagne a été créée", Colors.green, Icons.check,ToastificationType.success);
                        },
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
          width: 331,
          height: 679,
          //color: Colors.red,
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide( //                   <--- left side
                color: TColors.txtbouttongrey,
                width: 1.0,
              ),
              right: BorderSide( //                    <--- top side
                color: TColors.txtbouttongrey,
                width: 1.0,
              ),
            ),
            color: TColors.bg,
          ),
          child: Column(
            children: [
              //ContainerContact(text1: 'Tous', text2: 'Vos contacts', icon: Icons.account_circle, badge: true,),
              Container(
                height: 90,
                width: 90,
                margin: const EdgeInsets.only(left: 30,right: 30,top: 30,bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: TColors.greycontact,
                ),
                child: const Icon(Icons.calendar_month,color: TColors.txtbouttongreydark,size: 28,),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      pageId = 0;
                    });
                  },
                  child: pageId == 0
                      ? const ContainerActifMessage(text1: "Paramètres campagne", text2: "Nom, contacts, planning", icon: Icons.person, actif: true, etiquette: false,)
                      : const ContainerActifMessage(text1: "Paramètres campagne", text2: "Nom, contacts, planning", icon: Icons.person, actif: false, etiquette: false,)
              ),
              const Divider(
                color: TColors.txtbouttongrey,
                indent: 35,
                endIndent: 35,
              ),
              GestureDetector(
                  onTap: activation == false? (){
                    showtoast("Error!!","valider les paramètres de la campagne en cliquant sur suivant", Colors.red, Icons.error,ToastificationType.error);
                  }:(){
                    setState(() {
                      pageId = 1;
                    });
                  },
                  child: pageId == 1
                      ? const ContainerActifMessage(text1: "Rédaction message", text2: "Le contenu de votre campagne", icon: Icons.email, actif: true, etiquette: false)
                      : const ContainerActifMessage(text1: "Rédaction message ", text2: "Le contenu de votre campagne", icon: Icons.email, actif: false, etiquette: false)
              ),
              const Divider(
                color: TColors.txtbouttongrey,
                indent: 35,
                endIndent: 35,
              ),
              GestureDetector(
                  /*onTap: () {
                    setState(() {
                      pageId = 2;
                    });
                  },*/
                  child: pageId == 2
                      ? const ContainerActifMessage(text1: "Importer campagne (Excel, CSV)", text2: "Importer votre campagne", icon: Icons.calendar_month, actif: true, etiquette: false)
                      : const ContainerActifMessage(text1: "Importer campagne (Excel, CSV)", text2: "Importer votre campagne", icon: Icons.calendar_month, actif: false, etiquette: false)
              ),
            ],
          ),

        ),
        pageId == 0 ? Form(
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
                            TextFormFieldWidget(label: "Nom campagne",icon: Icons.camera,width: 505,color: TColors.txtbouttongreydark,controller: nomCampagneController,validator: "Entrer le nom de la campagne",),
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
                            TextFormFieldWidget(label: "Résumé campagne",icon: Icons.edit,width: 1060,color: TColors.txtbouttongreydark,controller: resumeController,),
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
                          height: 65,
                          width: double.infinity,
                          //width: 300,
                          color: TColors.bg,
                          //color: Colors.red,
                          child: Row(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: contact.length,
                                  itemBuilder:
                                      (context, index) {
                                    return InkWell(
                                      onTap: () {},
                                      child: ContactCampagne(image: contact[index]["image"], name: contact[index]["nom_prenom"], ontap: () {
                                       setState(() {
                                         contact.removeAt(index);
                                         showtoast("Succès!!","Votre contact a été supprimé de la liste", Colors.green, Icons.check,ToastificationType.success);
                                       });
                                      },),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 20,),
                              Container(
                                width: 150,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(8),
                                  color: const Color.fromARGB(
                                      255, 107, 89, 204),
                                ),
                                child: TextButton(
                                  //onPressed: (){openRemaindContact},
                                  onPressed: (){
                                    selectedGroupe == null? openAllContact(context):openRemaindContact(context);
                                  },
                                  child: Text(
                                    "Ajouter Contacts",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                        color: Colors.white,
                                        fontFamily: "LatoBold"
                                    ),
                                  ),
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
                                      getContactRemaind();
                                      getNom();
                                      getEmail();
                                      getTel();
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
                                    result == null ?
                                    Text("Sélection fichier",style:
                                    Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                        color: TColors.title,
                                        fontSize: 14, fontFamily: "LatoRegular"),):
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
                                            result = csvFile;
                                          });
                                          /*setState(() {
                                            widget.nomController.text = rowsAsListOfValues.elementAt(i).elementAt(0);
                                          });*/
                                        }
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
                  BouttonCampagne(onPressed1: () {Navigator.pop(context);}, onPressed2:(){
                    {
                      if(formKey.currentState!.validate() && (contact.isNotEmpty)){
                        setState(() {
                          pageId = 1;
                          activation = true;
                          nomvalue;
                          telvalue;
                          emailvalue;
                          //print("la nouvelle valeur est $nomvalue");
                        });
                      }else if(contact.isEmpty){
                        // dialog.show();
                        showtoast("Error!!","Ajouter des contacts", Colors.red, Icons.error,ToastificationType.error);
                      }
                    }
                  }, text1: 'Annuler', text2: 'Suivant',)
                ],
              ),
            ),
          ),
        ) : (pageId == 1 ? Form(
            key: formKey2,
            child: Row(
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
                       // const SizedBox(height: 10,),
                        Container(
                          width: 700,
                          height: 365,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade200,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                                child: TextFormField(
                                  controller: messageController,
                                  maxLines: 10,
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 13, fontFamily: "LatoRegular"),
                                  decoration: InputDecoration(
                                    hintText: "Saisisser votre message",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                        color: TColors.txtbouttongreydark,
                                        fontFamily: "LatoLight",
                                        fontSize: 12),
                                    border: InputBorder.none,
                                  ),
                                  cursorColor: TColors.title,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return "";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const Spacer(),

                             _imagePicker == null?  const SizedBox(
                                  height: 50,
                                  width: 700,
                                  //color: Colors.red,
                                  child:Text('')
                              ):SizedBox(
                                //height: 150,
                                  width: 700,
                                  //color: Colors.red,
                                  child:
                                  Image.memory(Uint8List.fromList(_imagePicker!.bytes!),width: 60,height: 60,)
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
                                              _imagePicker = resultat?.files.first;

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

                    BouttonCampagne(onPressed1: () {setState(() {pageId = 0;});}, onPressed2: ()
                    {
                      /*String s = '#nom';
                      if (messageController.text.contains(s)) {
                        getNom();
                      } else {
                        print('nu este');
                      }*/
                     if(formKey2.currentState!.validate()){
                        String? nom = '#nom';
                        String? tel = '#telephone';
                        String? email = '#email';
                        if(_imagePicker == null){
                          //print("l'ancien nom est $nom");
                          if(messageController.text.contains(nom) || messageController.text.contains(tel) || messageController.text.contains(email) ){
                            setState(() {
                              nom = nomvalue;
                              tel = telvalue;
                              email = emailvalue;
                            });
                           // print("la nouvelle valeur est $nom");
                            //print("la deuxieme valeur est $tel");
                            //print("la troisieme valeur est $email");
                           // message = messageController.text;
                              //messageController.text = message?.replace('é', '&eacute');
                            //message = messageController.text.replaceAll("#nom", nom!);
                              //print(message);
                              //print(message);
                          }else{
                            setState(() {
                              message = messageController.text;
                            });
                            print("aucun import");
                            print(message);
                          }
                        }else{
                          message = messageController.text + _imagePicker!.name;
                        }


                        openPromoWidgetDialog(context);


                      }else {
                        showtoast("Error!!","Saisisser le contenu de votre message", Colors.red, Icons.error,ToastificationType.error);
                      }
                      }

                      , text1: 'Prédécent', text2: 'Suivant',)

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 22.0,left: 50),
                        child: Center(
                          child: Text('Liste shortcodes',style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                              fontFamily: "LatoBold",
                              fontSize: 16,
                              color: TColors.title),),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50.0,bottom: 5,top: 10),
                        child: Text("#nom"),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50.0,bottom: 5),
                        child: Text("#telephone"),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50.0,bottom: 5),
                        child: Text("#email"),
                      ),

                    ],
                  ),

                ),
              )
            ],
          ),
        )
        : ImporterCampagne()

        )

      ],
    );
  }

}
