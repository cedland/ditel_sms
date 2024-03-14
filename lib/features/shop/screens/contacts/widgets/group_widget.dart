import 'dart:convert';
import 'package:ditel_sms_app/features/shop/screens/dashboard/dashbord.dart';
import 'package:flutter/material.dart';
import '../../../../../classes/contact_model.dart';
import '../../../../../classes/groupe_model.dart';
import '../../../../../common/widgets/login/text_form_field.dart';
import '../../../../../data/dummy_data.dart';
import '../../../../../services/contact_services.dart';
import '../../../../../services/groupe_services.dart';
import '../../../../../utils/constants/colors.dart';
import '../widget_contact/container_actif_contact.dart';
import '../widget_contact/widget_contact.dart';
import 'contact_list_view.dart';
import 'package:http/http.dart' as http;
import 'package:toastification/toastification.dart';
import 'package:get/get.dart';
import 'dart:io';
class GroupWidget extends StatefulWidget {
  const GroupWidget({
    super.key,
  });

  @override
  State<GroupWidget> createState() => _GroupWidgetState();
}

class _GroupWidgetState extends State<GroupWidget> with TickerProviderStateMixin {
  String selected = "";
  var pageId = 0;
  final _formKey = GlobalKey<FormState>();
  TextEditingController groupeController = TextEditingController();

  //List groupedata=[];
  late final AnimationController animationController;
  List contactdata=[];
  //List<GroupeModel> groupeList =[];
  bool loading = true;
  bool choix = false;



  List<GroupeModel> listGroupe=[];
  bool isgroupe = true;

  List<ContactModel> listContact=[];
  bool iscontact = true;





  getAllGroupe()async{
    listGroupe= await GroupeService().getGroupe();
    setState(() {
      isgroupe = false;
    });
  }


  getAllContact()async{
    listContact= await ContactService().getContact();
    setState(() {
      iscontact = false;
    });
  }


  /*Future<dynamic> generateGroupList() async {

    // Give your sever URL of get_employees_details.php fil
    String uri = "http://192.168.0.110/ditel_sms_php/get_groupe.php";

    final response = await http.get(Uri.parse(uri));
    var list = json.decode(response.body);
    List<GroupeModel> _groupemodel = await list.map<GroupeModel>((json) => GroupeModel.fromJson(json)).toList();
    //employeeDataSource = EmployeeDataSource(_groupemodel);
    
    print(_groupemodel);
    return _groupemodel;
  }*/



  /*Future<void>getContact() async{
    String uri = "http://192.168.0.110/ditel_sms_php/get_all_contact.php";
    try{
      var response = await http.get(Uri.parse(uri));

      setState(() {
        contactdata = jsonDecode(response.body);
      });
    }
    catch(e){print(e);}
  }*/


  /*Future<void>getGroupe() async{
    String uri = "http://192.168.0.110/ditel_sms_php/get_all_groupe.php";
    try{
      var response = await http.get(Uri.parse(uri));

      setState(() {
        groupedata = jsonDecode(response.body);
      });
    }
    catch(e){print(e);}
  }*/

  add(GroupeModel groupeModel)async{
    final response = await GroupeService().addGroupe(groupeModel);
    if(response == "success"){
      showtoast("Succès!", "${groupeController.text} créé avec succès ", Colors.green, Icons.check,ToastificationType.success);
      getAllGroupe();
      groupeController.text = "";
      setState(() {
        pageId = 0;
      });
      Get.to(() => Dashboard(2));

    }else{
      showtoast("Erreur!", "${groupeController.text} existe déja ", Colors.red, Icons.error_outline_outlined,ToastificationType.error);
      groupeController.text = "";
      setState(() {
        pageId = 0;
      });
      Get.to(() => Dashboard(2));
    }
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
      direction: TextDirection.ltr,
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
    getAllGroupe();
    getAllContact();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    super.initState();
  }


  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 331,
          height: 679,
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
            //color: Colors.red,
          ),
          child: Column(
            children: [
              //ContainerContact(text1: 'Tous', text2: 'Vos contacts', icon: Icons.account_circle, badge: true,),
              const SizedBox(height: 20,),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      pageId = 0;
                    });
                  },
                  child: pageId == 0
                      ? ContainerActifContact(text1: "Tous", text2: "Vos contacts", icon: Icons.folder, actif: true, etiquette: true, text3: "${listContact.length}",color: Colors.green,)
                      : ContainerActifContact(text1: "Tous", text2: "Vos contacts", icon: Icons.folder, actif: false, etiquette: true, text3: "${listContact.length}",color: Colors.green,)
              ),
              const Divider(
                color: TColors.txtbouttongrey,
                indent: 35,
                endIndent: 35,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      pageId = 1;
                    });
                  },
                  child: pageId == 1
                      ? const ContainerActifContact(text1: "Entreprises", text2: "Vos entreprises", icon: Icons.people, actif: true, etiquette: false)
                      : const ContainerActifContact(text1: "Entreprises", text2: "Vos entreprises", icon: Icons.people, actif: false, etiquette: false)
              ),
              const Divider(
                color: TColors.txtbouttongrey,
                indent: 35,
                endIndent: 35,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      pageId = 2;
                    });
                  },
                  child: pageId == 2
                      ? const ContainerActifContact(text1: "Clients", text2: "Vos clients", icon: Icons.people, actif: true, etiquette: false, text3: '3',color: Colors.orange,)
                      : const ContainerActifContact(text1: "Clients", text2: "Vos clients", icon: Icons.people, actif: false, etiquette: false, text3: '3',color: Colors.orange,)
              ),
              const Divider(
                color: TColors.txtbouttongrey,
                indent: 35,
                endIndent: 35,
              ),
              SizedBox(
                width: 331,
                height: 220,
                child: isgroupe ? Center(child: CircularProgressIndicator(),) : ListView.builder(
                    itemCount: listGroupe.length,
                    itemBuilder: (context,index)
                    {
                      GroupeModel groupe = listGroupe[index];
                      return InkWell(onTap:(){
                        setState(() {
                          selected =groupe.id!;
                          pageId = 3;
                        });
                      },child: selected == groupe.id! && pageId == 3?
                          ContainerActifContact(text1: groupe.nom_groupe!, text2: "Votre groupe", icon: Icons.people, actif: true, etiquette: false, text3: '3',color: Colors.orange,)
                          :ContainerActifContact(text1:groupe.nom_groupe!, text2: "Votre groupe", icon: Icons.people, actif: false, etiquette: false, text3: '3',color: Colors.orange,)
                      );})
              ),
              const Divider(
                color: TColors.txtbouttongrey,
                indent: 35,
                endIndent: 35,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      pageId = 4;
                    });
                  },
                  child: pageId == 4
                      ? const ContainerActifContact(text1: "Ajouter", text2: "un nouveau groupe", icon: Icons.add_circle_outlined, actif: true, etiquette: false)
                      : const ContainerActifContact(text1: "Ajouter", text2: "un nouveau groupe", icon: Icons.add_circle_outlined, actif: false, etiquette: false)
              ),

              const Spacer(),

              GestureDetector(
                  onTap: () {
                    setState(() {
                      pageId = 5;
                    });
                  },
                  child: pageId == 5
                      ? const ContainerActifContact(text1: "Supprimer", text2: "Messages supprimés", icon: Icons.delete, actif: true, etiquette: false)
                      : const ContainerActifContact(text1: "Supprimer", text2: "Messages supprimés", icon: Icons.delete, actif: false, etiquette: false)
              ),

            ],
          ),
        ),

        pageId == 0 ? Container(
          color: TColors.bg,
          height: double.infinity,
          width: 1096,
          child: const Row(
            children: [
              Expanded(child: ContactListView()),
            ],
          ),
        ) :
        (pageId == 1 ? const Text('') :
        (pageId == 2 ? const Text('') :
        (pageId == 3 ? const Text('') :
        (pageId == 4 ? SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width -440,
          //color: Colors.blue,
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height - 80,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 8,right: 8,top: 120),
                        child: Text(
                          "Ajouter un groupe",
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
                        child: TextFormFieldWidget(label: "Nom du groupe", icon: Icons.people,width: 900,color: TColors.txtbouttongreydark,controller: groupeController,validator: "Vueiller entrer le nom du groupe",),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50,),

                  Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(8),
                      color: const Color.fromARGB(
                          255, 107, 89, 204),
                    ),
                    child: TextButton(
                      onPressed:  () {
                        if(_formKey.currentState!.validate()){
                          setState(() {
                            GroupeModel groupeModel = GroupeModel(nom_groupe: groupeController.text);
                            add(groupeModel);
                          });
                        }
                      },
                      child: Text('Enregistrer',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),):const Text(''))
        )
        )
        )
      ],
    );
  }
}