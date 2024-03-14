import 'dart:convert';

import 'package:ditel_sms_app/classes/contact_model.dart';
import 'package:ditel_sms_app/features/shop/screens/dashboard/dashbord.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multiple_search_selection/multiple_search_selection.dart';
import 'package:toastification/toastification.dart';

import '../../../../utils/constants/colors.dart';
import '../campagne/widgets/boutton_campagne.dart';
import '../campagne/widgets/rounded_image.dart';
class ContactGroupe extends StatefulWidget {
  const ContactGroupe({super.key});

  @override
  State<ContactGroupe> createState() => _ContactGroupeState();
}

class _ContactGroupeState extends State<ContactGroupe> {
  List dataGroupe = [];
  String? selectedGroupe;
  final scrollController = ScrollController();
  final scrollController2 = ScrollController();
  List contactalldata = [];
  List contactSelect = [];
  List contactdata=[];
  List contactdataremaind=[];
  List contact = [];
  List searchContact = [];
  String? indexvalue;

  Future<void> updaterecord() async{
    try{
      String uri = "http://192.168.0.110/ditel_sms_php/update_groupe_contact.php";
      var res= await http.post(Uri.parse(uri),headers: {"Accept":"application/json"},body: {"groupe_nom":selectedGroupe});

      var response = jsonDecode(res.body);

      if(response["success"] == "true"){
        print("updated");
      }else{
        print("some issue");
      }

    }catch(e)
    {
      print(e);
    }
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

  Future<void>getContact() async{
    String uri = "http://192.168.0.110/ditel_sms_app_php/get_groupe_contact.php";
    try{
      //var response = await http.post(Uri.parse(uri),headers: {"Accept":"application/json"},body: {"groupe_nom":selectedGroupe ?? "[]"});
      var response = await http.post(Uri.parse(uri),headers: {"Accept":"application/json"},body: {"groupe_nom":selectedGroupe});
      setState(() {
        contactdata = jsonDecode(response.body);
        contact = contactdata;
        searchContact = contact;
        //print(searchContact);
      });
    }
    catch(e){print(e);}
  }


  void _runFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = contact;
    } else {
      results = contact
          .where((user) =>
          user["nom_prenom"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      searchContact = results;
    });
  }
  Future<void>getContactRemaind() async{
    String uri = "http://192.168.0.110/ditel_sms_app_php/get_groupe_contact_remaind.php";
    try{
      //var response = await http.post(Uri.parse(uri),headers: {"Accept":"application/json"},body: {"groupe_nom":selectedGroupe ?? "[]"});
      var response = await http.post(Uri.parse(uri),headers: {"Accept":"application/json"},body: {"groupe_nom":selectedGroupe});
      setState(() {
        contactdataremaind = jsonDecode(response.body);
        contactalldata = contactdataremaind;
        getContact();
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




  @override
  void initState() {
    getGroupe();
    getAllContact();
    searchContact = contact;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      SizedBox(
        width: 875,
        //color: Colors.red,
        child: Center(
          child: DropdownButton(
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
              });
            },
          ),
        ),
      ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: SizedBox(
              width: 905,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(8),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 3 +55,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.width / 4 + 70,
                          child: SingleChildScrollView(
                            child: MultipleSearchSelection(
                              showedItemsScrollController: scrollController,
                              searchField: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Rechercher contact',
                                  hintStyle: const TextStyle(
                                    fontSize: 12,
                                      fontFamily: "LatoRegular"

                                  ),
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
                                  padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 6),
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child:Image.network(contact["image"],
                                              width: 16,
                                              height: 16,
                                              errorBuilder: (BuildContext context, Object exception,
                                                  StackTrace? stackTrace) {
                                                return Image.asset('assets/images/dashboard/img1.png');
                                              },
                                            ),
                                          ),
                                          const SizedBox(width: 20,),
                                          Text(contact["nom_prenom"],style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                              color: TColors.title,
                                              fontFamily: "LatoRegular",fontSize: 12),
                                          )
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
                              title: Text(selectedGroupe == null?
                                "Tous les contacts":"Contacts à sélectionner",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                  color: TColors.title,
                                  fontFamily: "LatoBold",fontSize: 14),
                              ),
                              showSelectAllButton: true,
                              maximumShowItemsHeight: 500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 100.0),
                          child: Container(
                            width: 150,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(8),
                              color: const Color.fromARGB(
                                  255, 107, 89, 204),
                            ),
                            child: TextButton(
                              onPressed: (){
                                selectedGroupe == null?
                         showtoast("Error!!","Sélectionner un groupe", Colors.red, Icons.error,ToastificationType.error):
                                    setState(() {
                                      contact = contactSelect + contactdata;
                                      searchContact = contact;
                                    });
                              },
                              child: Text(
                                "Ajouter au groupe",
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(8),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 3 +5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Contacts par groupe", style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                            color: TColors.title,
                            fontFamily: "LatoBold",fontSize: 14),),
                        const SizedBox(height: 25,),
                        TextField(
                          onChanged: (value) => _runFilter(value),
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.search),
                            hintText: 'Rechercher contact',
                            hintStyle: const TextStyle(
                                fontSize: 12,
                                fontFamily: "LatoRegular"
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          height: 340,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(8),
                            color: Colors.grey.shade50,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: searchContact.isNotEmpty ?

                          ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: searchContact.length,
                                  itemBuilder:
                                      (context, index) {
                                    return  Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 6),
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 15,
                                          ),
                                          child: Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child:Image.network(searchContact[index]["image"],
                                                  width: 16,
                                                  height: 16,
                                                  errorBuilder: (BuildContext context, Object exception,
                                                      StackTrace? stackTrace) {
                                                    return Image.asset('assets/images/dashboard/img1.png');
                                                  },
                                                ),
                                              ),
                                              const SizedBox(width: 20,),
                                              Text(searchContact[index]["nom_prenom"],style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                  color: TColors.title,
                                                  fontFamily: "LatoRegular",fontSize: 12),
                                              ),

                                              const Spacer(),
                                              InkWell(onTap:(){
                                                setState(() {
                                                  searchContact.removeAt(index);
                                                  showtoast("Succès!!","Votre contact a été supprimé de la liste", Colors.green, Icons.check,ToastificationType.success);
                                                });
                                              },child: Icon(Icons.clear))
                                            ],
                                          ),
                                        ),
                                      ),

                                    );


                                  },
                                ) : Center(
                                  child: Text('Aucun contact trouvé',
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.red, fontFamily: "LatoBold",fontSize: 16),),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18,),
                    Row(
                      children: [
                        BouttonCampagne(onPressed1: () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dashboard(0)),
                        ); }, onPressed2: () {
                          setState(() {

                            //contact = contactdata + contactSelect;
                            //Navigator.of(context).pop();
                            //showtoast("Succès!!","${contactSelect.length} nouveaux contacts ajoutés", Colors.green, Icons.check,ToastificationType.success);
                          });
                        }, text1: 'Annuler', text2: 'Modifier',),
                      ],
                    )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
    ],
        ),
        );
  }
}
