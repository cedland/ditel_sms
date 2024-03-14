import 'dart:convert';

import 'package:flutter/material.dart';
import 'contact_detailled.dart';
import 'contact_info.dart';
import 'contact_page_select.dart';
import 'package:http/http.dart' as http;
class ContactListView extends StatefulWidget {

  const ContactListView({super.key});
  @override
  ContactListViewState createState() => ContactListViewState();
}

class ContactListViewState extends State<ContactListView> {
  List contactdata=[];

  Future<void>getContact() async{
    String uri = "http://192.168.0.109/ditel_sms_php/get_all_contact.php";
    try{
      var response = await http.get(Uri.parse(uri));

      setState(() {
        contactdata = jsonDecode(response.body);
      });
    }
    catch(e){print(e);}
  }

  int? selectedContactIndex;
  void _onContactPressed(int index) {
    setState(() {
      selectedContactIndex = index;
    });
  }

  void _onClosePressed() {
    setState(() {
      selectedContactIndex = null;
    });
  }


  @override
  void initState() {
    getContact();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 130,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: contactdata.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      _onContactPressed(index);
                      //getNomGroupe();
                    },
                    child: ContactDetailed(connected: true, image: contactdata[index]["image"], name: contactdata[index]["nom_prenom"], fonction: contactdata[index]["fonction"], telephone: contactdata[index]["telephone"],),
                  );
                },
              ),
            ),
            const ContactPageSelect()
          ],
        ),
        if (selectedContactIndex != null)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child:
            ContactInfo(
              //contact: widget.contacts[selectedContactIndex!],
              onClosePressed: _onClosePressed, image: contactdata[selectedContactIndex!]["image"], name: contactdata[selectedContactIndex!]["nom_prenom"], fonction: contactdata[selectedContactIndex!]["fonction"], telephone: contactdata[selectedContactIndex!]["telephone"], email: contactdata[selectedContactIndex!]["email"], groupe: contactdata[selectedContactIndex!]["groupe_nom"], adresse: contactdata[selectedContactIndex!]["adresse"], complement: contactdata[selectedContactIndex!]["complement_adresse"], cp: contactdata[selectedContactIndex!]["code_postal"], pays: contactdata[selectedContactIndex!]["pays"], ville: contactdata[selectedContactIndex!]["ville"],
            ),
          ),
      ],
    );
  }
}