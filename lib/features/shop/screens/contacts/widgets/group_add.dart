import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../classes/contact_model.dart';
import '../../../../../classes/groupe_model.dart';
import '../../../../../common/widgets/login/text_form_field.dart';
import '../../../../../services/contact_services.dart';
import '../../../../../utils/constants/colors.dart';
import '../../dashboard/dashbord.dart';
import 'boutton_contact.dart';
import 'container_actif.dart';
import 'package:http/http.dart' as http;
import 'package:toastification/toastification.dart';


import 'dart:typed_data';
import 'dart:html' as html;
class GroupAdd extends StatefulWidget {
  const GroupAdd({
    super.key,
  });

  @override
  State<GroupAdd> createState() => _GroupAddState();
}

class _GroupAddState extends State<GroupAdd> with TickerProviderStateMixin{

  List<int>? _selectedFile;
  Uint8List? _bytesData;
  //espace remplissage formulaire
  late final AnimationController animationController;
  TextEditingController nameController = TextEditingController();
  TextEditingController entrepriseController = TextEditingController();
  TextEditingController fonctionController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  TextEditingController complementController = TextEditingController();
  TextEditingController cpController = TextEditingController();
  TextEditingController villeController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController lienrs1 = TextEditingController();
  TextEditingController lienrs2 = TextEditingController();
  TextEditingController lienrs3 = TextEditingController();
  TextEditingController lienrs4 = TextEditingController();
  String civilite ="" ;
  String date_naissance ="";
  String? image;
  String imagedata ="";
  String? imagedata2;
  Uint8List? selectedImageInBytes;
  FilePickerResult? fileResultfinal;
  Uint8List? dataimage;
  String? jsonvalue;
  String? imagename1;
  String? imagedata1;
  bool activation = false;

  List<GroupeModel> listGroupe=[];
  bool isgroupe = true;
  String? groupe_nom;



  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  var pageId = 0;

  String? selectedPays;
  String? selectedRs1;
  String? selectedRs2;
  String? selectedRs3;
  String? selectedRs4;
  List dataGroupe = [];
  List dataPays = [];
  List dataRs = [];

  startWebFilePicker() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = false;
    uploadInput.draggable = true;
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      final file = files![0];
      final reader = html.FileReader();
      reader.onLoadEnd.listen((event) {
        setState(() {
          _bytesData = const Base64Decoder().convert(reader.result.toString().split(",").last);
          _selectedFile = _bytesData;
          image = file.name;
        });

      });
      reader.readAsDataUrl(file);
    });
  }


  add(ContactModel contactModel)async{
    final response = await ContactService().addContact(contactModel);
    if(response == "success"){
      civilite = "";
      nameController.text = "";
      entrepriseController.text = "";
      fonctionController.text = "";
      date_naissance ="";
      adresseController.text="";
      complementController.text="";
      cpController.text="";
      villeController.text="";
      emailController.text="";
      telController.text="";
      lienrs1.text ="";
      lienrs2.text ="";
      lienrs3.text ="";
      lienrs4.text ="";
      setState(() {
        pageId = 0;
      });
      showtoast("Succès!", "contact  créé avec succès ", Colors.green, Icons.check,ToastificationType.success);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(0)),);
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

  Future getPays() async{
    String uri = "http://192.168.0.110/ditel_sms_app_php/get_pays.php";
    var response = await http.post(Uri.parse(uri),headers: {"Accept":"application/json"});
    var jsonBody = response.body;
    var jsonData = json.decode(jsonBody);
    setState(() {
      dataPays = jsonData;
    });
    return "success";
  }
  Future getRs() async{
    String uri = "http://192.168.0.110/ditel_sms_app_php/get_rs.php";
    var response = await http.post(Uri.parse(uri),headers: {"Accept":"application/json"});
    var jsonBody = response.body;
    var jsonData = json.decode(jsonBody);
    setState(() {
      dataRs = jsonData;
    });
    return "success";
  }


  @override
  void initState() {
    super.initState();
    getGroupe();
    getPays();
    getRs();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));

  }
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
        date_naissance = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
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

  void openWidget(BuildContext context) {
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
            height: MediaQuery.of(context).size.width / 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Importer un contact",
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
                          border: Border.all(width: 0.1)
                      ),
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
                Text(
                    "Importez vos contacts par fichier XLS ou CSV. Prenez soin de respecter les conditions",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(
                        color: TColors.title,
                        fontSize: 12),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Importer contacts (XLS, CSV)",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                          color: TColors.txtbouttongreydark,
                          fontSize: 12),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sélection fichier",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                color: TColors.title,
                                fontSize: 14,fontWeight: FontWeight.bold),),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 240, 238, 250),
                            borderRadius: BorderRadiusDirectional.circular(8),

                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.more_horiz,
                              size: 18,
                              color: Color.fromARGB(255, 107, 89, 204),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        )
                      ],
                    )
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
                              color:
                              const Color.fromARGB(255, 128, 131, 163)),
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

    return Form(
      key: _formKey,
      child: Row(
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
               Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Container(
                     height: 114,
                     width: 114,
                     margin: const EdgeInsets.only(left: 30,right: 30,top: 30,bottom: 10),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(15),
                       color: TColors.greycontact,
                     ),
                     child: Center(
                       child: Stack(
                         children: <Widget>[
                           _bytesData != null ?
                               Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(15),
                                   color: TColors.greycontact,
                                 ),
                                 margin: const EdgeInsets.all(8),
                                 child: Image.memory(_bytesData!,
                                   width: 120,
                                   height: 120,
                                   fit: BoxFit.fill,
                                 ),

                               ) :Container(
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(15),
                               color: TColors.greycontact,
                             ),
                             margin: const EdgeInsets.all(8),
                             child: InkWell(onTap:(){startWebFilePicker();},child: const Icon(Icons.cloud_upload_rounded,color: TColors.txtbouttongreydark,size: 28,)),

                           ),
                           Positioned(
                               bottom: 46,
                               right: 42,
                               child: InkWell(
                                 onTap: (){startWebFilePicker();},
                                 child: const Icon(Icons.cloud_upload_rounded,color: TColors.txtbouttongreydark,size: 28,)
                               ))

                         ],
                       ),
                     ),
                    ),
                   const SizedBox(height: 10,),
                   Text(nameController.text,style: Theme.of(context)
                       .textTheme
                       .bodySmall!
                       .copyWith(
                       color: TColors.title,
                       fontSize: 17,fontWeight: FontWeight.bold)),
                   const SizedBox(height: 3,),
                   Text(fonctionController.text, style: Theme.of(context)
                       .textTheme
                       .bodySmall!
                       .copyWith(
                       color: TColors.txtbouttongreydark,
                       fontSize: 13
                   ))

                 ],
               ),
                const SizedBox(height: 20,),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        pageId = 0;
                      });
                    },
                    child: pageId == 0
                        ?  ContainerActif(text1: "Information générales", text2: "Photo, nom, adresse", icon: Icons.person, actif: true, activation: activation,)
                        :  ContainerActif(text1: "Information générales", text2: "Photo, nom, adresse", icon: Icons.person, actif: false, activation: activation,)),
                const Divider(
                  color: TColors.txtbouttongrey,
                  indent: 35,
                  endIndent: 35,
                ),
                GestureDetector(
                  onTap: activation == false? (){
                    showtoast("Error!!","valider les informations générales en cliquant sur suivant", Colors.red, Icons.error,ToastificationType.error);
                  }:(){
                    setState(() {
                      pageId = 1;
                    });
                  },
                  child: pageId == 1
                      ? ContainerActif(text1: "Contact", text2: "N° tel, email",icon: Icons.notifications,actif: true, activation: activation,)
                      : ContainerActif(text1: "Contact", text2: "N° tel, email",icon: Icons.notifications,actif: false, activation: activation,)
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 250,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(
                              255, 107, 89, 204),
                        ),
                        child: TextButton(
                          onPressed: () {
                            openWidget(context);
                          },
                          child: Text(
                            "Import contacts XLS, CSV",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),

          ),
         pageId == 0
             ? Expanded(
           child: Form(
             key: _formKey1,
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
                                       groupValue: civilite,
                                       onChanged: (value){
                                         setState(() {
                                           civilite = value.toString();
                                         });
                                       },
                                     ),
                                   ),
                                   Expanded(
                                     flex: 1,
                                     child:  RadioListTile(
                                       title: Text("Mr"),
                                       value: "Mr",
                                       groupValue: civilite,
                                       onChanged: (value){
                                         setState(() {
                                           civilite = value.toString();
                                         });
                                       },
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                             TextFormFieldWidget(label: "Nom & prénom", icon: Icons.person,width: 505,color: TColors.txtbouttongreydark,controller: nameController,validator: "Vueiller entrer votre nom",),
                           ],
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.symmetric(horizontal: 8.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             TextFormFieldWidget(label: "Entreprise",icon: Icons.domain,width: 505,color: TColors.txtbouttongreydark,controller: entrepriseController,),
                             TextFormFieldWidget(label: "Fonction",icon: Icons.record_voice_over_rounded,width: 505,color: TColors.txtbouttongreydark,controller: fonctionController,),
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
                                                 Text(date_naissance),
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
                                             value: groupe_nom,
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
                                                 groupe_nom = value;
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
                             TextFormFieldWidget(label: "Adresse",icon: Icons.location_on,width: 505,color: TColors.txtbouttongreydark,controller: adresseController,),
                             TextFormFieldWidget(label: "Complément",icon: Icons.location_on,width: 505,color: TColors.txtbouttongreydark,controller: complementController,),
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
                                // color: Colors.blue,
                                 width:505,
                                 child:  Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                    // TextFormFieldWidget(label: "Code postal",icon: Icons.location_on,width: 230,color: TColors.txtbouttongreydark,controller: cpController,keyboardType: TextInputType.number),
                                     SizedBox(
                                       width: 230,
                                       height: 70,
                                       child: TextFormField(
                                         controller: cpController,
                                         keyboardType: TextInputType.number,
                                         style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: TColors.title, fontSize: 12, fontFamily: 'LatoBold'),
                                         decoration: InputDecoration(
                                           suffixIcon:  const Icon(
                                             Icons.location_on,
                                             size: 18,
                                             color: TColors.txtbouttongreydark,
                                           ),
                                           labelText: "Code postal",
                                           //hintText: "Start typing...",
                                           labelStyle: Theme.of(context)
                                               .textTheme
                                               .bodySmall!
                                               .copyWith(
                                               color: TColors.subtitle,
                                               fontFamily: "LatoRegular",
                                               fontSize: 12),

                                         ),
                                         cursorColor: TColors.title,
                                           validator: (value) {
                                             if (value == null || value.trim().isEmpty) {
                                               return null;
                                             }
                                             else if(int.tryParse(value!) != null){
                                               return null;
                                             }
                                             return "Code postal invalide ";
                                           }
                                       ),
                                     ),
                                     TextFormFieldWidget(label: "Ville",icon: Icons.location_on,width: 230,color: TColors.txtbouttongreydark,controller: villeController,),
                                   ],
                                 ),
                               ),
                             ),
                             //TextFormFieldWidget(label: "Complément",icon: Icons.person,hintext:"Entrer le complément d'adrese",width: 505,color: TColors.txtbouttongreydark,),
                             Padding(
                               padding: const EdgeInsets.only(bottom: 10.0),
                               child: Container(
                                 width: 505,
                                 height: 70,
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
                                      // const SizedBox(height: 10,),
                                       DropdownButton(
                                         // Initial Value
                                         value: selectedPays,
                                         hint: const Text("Sélectionner un pays"),
                                         isExpanded: true,
                                         focusColor: TColors.bg,
                                         // Down Arrow Icon
                                         icon: const Icon(Icons.keyboard_arrow_down),

                                         // Array list of items
                                         items: dataPays.map((list) {
                                           return DropdownMenuItem(
                                             value: list['nom_pays'].toString(),
                                             child: Text(list['nom_pays']),
                                           );
                                         }).toList(),
                                         // After selecting the desired option,it will
                                         // change button value to selected value
                                         onChanged: (value) {
                                           setState(() {
                                             selectedPays = value;
                                           });
                                         },
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
                   BouttonContact(onPressed1: () {
                     if(_formKey1.currentState!.validate() && groupe_nom != null && _bytesData != null ){
                       setState(() {
                         pageId = 1;
                         activation = true;
                       });
                     }else if(groupe_nom == null || _bytesData == null ){ //|| fileResultfinal == null
                      // dialog.show();
                       showtoast("Error!!","Sélectionner un groupe et une image", Colors.red, Icons.error,ToastificationType.error);
                     }
                   }, onPressed2: () {
                     Navigator.pop(context);
                     }, text: 'Suivant',)
                 ],
               ),
             ),
           ),
         ) : Expanded(
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
                           SizedBox(
                               width: 505,
                               height: 70,
                               child:
                             TextFormField(
                               controller: emailController,
                               style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: TColors.title, fontSize: 12, fontFamily: 'LatoBold'),
                               decoration: InputDecoration(
                                 suffixIcon:  const Icon(
                                   Icons.email,
                                   size: 18,
                                   color: TColors.txtbouttongreydark,
                                 ),
                                 labelText: "Email",
                                 //hintText: "Start typing...",
                                 labelStyle: Theme.of(context)
                                     .textTheme
                                     .bodySmall!
                                     .copyWith(
                                     color: TColors.subtitle,
                                     fontFamily: "LatoRegular",
                                     fontSize: 12),

                               ),
                               cursorColor: TColors.title,
                               validator: (value) {
                                 if (value == null || value.trim().isEmpty) {
                                   return null;
                                 }else if(RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value)){
                                   return null;
                                 }
                                 return "Email invalide ";
                               },
                             ),
                           ),

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
                          SizedBox(
                             width: 505,
                             height: 70,
                             child: TextFormField(
                               controller: telController,
                               keyboardType: TextInputType.number,
                               maxLength: 10,
                               style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: TColors.title, fontSize: 12, fontFamily: 'LatoBold'),
                               decoration: InputDecoration(
                                 counterText: "",
                                 suffixIcon:  const Icon(
                                   Icons.phone,
                                   size: 18,
                                   color: TColors.txtbouttongreydark,
                                 ),
                                 labelText: "Tel",
                                 //hintText: "Start typing...",
                                 labelStyle: Theme.of(context)
                                     .textTheme
                                     .bodySmall!
                                     .copyWith(
                                     color: TColors.subtitle,
                                     fontFamily: "LatoRegular",
                                     fontSize: 12),

                               ),
                               cursorColor: TColors.title,
                               /*validator: (value) {
                                 if (value == null || value.trim().isEmpty) {
                                   return "le numéro tél sans indicatif(+33) est réquis";
                                 }else if(telController.text.length != 10){
                                   return "Entrer un numéro de téléphone valide";
                                 }else if( RegExp(r'[0-9]').hasMatch(value)){
                                   return "Le numero n'est pas correct";
                                 }
                                 return null;
                               },*/
                               validator: (value) {
                                 if (value == null || value.trim().isEmpty) {
                                   return "le numéro tél sans indicatif(+33) est réquis";
                                 }
                                 else if(telController.text.length != 10){
                                   return "Entrer un numéro de téléphone valide";
                                 }
                                else if(int.tryParse(value!) != null){
                                   return null;
                                 }
                                 return "numero invalide ";
                               },
                             ),
                           ),
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
                   height: 15,
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
                           SizedBox(
                             width: 505,
                             //color: Colors.red,
                             child: Center(
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text("Réseau Social 1",style: Theme.of(context)
                                       .textTheme
                                       .bodySmall!
                                       .copyWith(
                                       color: TColors.subtitle,
                                       fontSize: 13),),
                                   DropdownButton(
                                     // Initial Value
                                     value: selectedRs1,
                                     hint: const Text("Sélectionner un réseau Social"),
                                     isExpanded: true,
                                     focusColor: TColors.bg,
                                     // Down Arrow Icon
                                     icon: const Icon(Icons.keyboard_arrow_down),

                                     // Array list of items
                                     items: dataRs.map((list) {
                                       return DropdownMenuItem(
                                         value: list['nom_rs'].toString(),
                                         child: Text(list['nom_rs']),
                                       );
                                     }).toList(),
                                     // After selecting the desired option,it will
                                     // change button value to selected value
                                     onChanged: (value) {
                                       setState(() {
                                         selectedRs1 = value;
                                       });
                                     },
                                   ),
                                 ],
                               ),
                             ),
                           ),
                            Padding(
                             padding: EdgeInsets.only(top: 20.0),
                             child: TextFormFieldWidget(label: "Lien",icon: Icons.link,hintext:"Ajouter lien profil",width: 505,color: TColors.txtbouttongreydark,controller: lienrs1),
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
                                   Text("Réseau Social 2",style: Theme.of(context)
                                       .textTheme
                                       .bodySmall!
                                       .copyWith(
                                       color: TColors.subtitle,
                                       fontSize: 13),),
                                   DropdownButton(
                                     // Initial Value
                                     value: selectedRs2,
                                     hint: const Text("Sélectionner un réseau Social"),
                                     isExpanded: true,
                                     focusColor: TColors.bg,
                                     // Down Arrow Icon
                                     icon: const Icon(Icons.keyboard_arrow_down),

                                     // Array list of items
                                     items: dataRs.map((list) {
                                       return DropdownMenuItem(
                                         value: list['nom_rs'].toString(),
                                         child: Text(list['nom_rs']),
                                       );
                                     }).toList(),
                                     // After selecting the desired option,it will
                                     // change button value to selected value
                                     onChanged: (value) {
                                       setState(() {
                                         selectedRs2 = value;
                                       });
                                     },
                                   ),
                                 ],
                               ),
                             ),
                           ),
                           Padding(
                             padding: EdgeInsets.only(top: 20.0),
                             child: TextFormFieldWidget(label: "Lien",icon: Icons.link,hintext:"Ajouter lien profil",width: 505,color: TColors.txtbouttongreydark,controller: lienrs2),
                             //child: TextFormFieldWidget(label: "Lien",icon: Icons.link,hintext:"Ajouter lien profil",width: 505,color: TColors.txtbouttongreydark,controller: lienrs2Controller),
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
                                   Text("Réseau Social 3",style: Theme.of(context)
                                       .textTheme
                                       .bodySmall!
                                       .copyWith(
                                       color: TColors.subtitle,
                                       fontSize: 13),),
                                   DropdownButton(
                                     // Initial Value
                                     value: selectedRs3,
                                     hint: const Text("Sélectionner un réseau Social"),
                                     isExpanded: true,
                                     focusColor: TColors.bg,
                                     // Down Arrow Icon
                                     icon: const Icon(Icons.keyboard_arrow_down),

                                     // Array list of items
                                     items: dataRs.map((list) {
                                       return DropdownMenuItem(
                                         value: list['nom_rs'].toString(),
                                         child: Text(list['nom_rs']),
                                       );
                                     }).toList(),
                                     // After selecting the desired option,it will
                                     // change button value to selected value
                                     onChanged: (value) {
                                       setState(() {
                                         selectedRs3 = value;
                                       });
                                     },
                                   ),
                                 ],
                               ),
                             ),
                           ),
                           Padding(
                             padding: EdgeInsets.only(top: 20.0),
                             child: TextFormFieldWidget(label: "Lien",icon: Icons.link,hintext:"Ajouter lien profil",width: 505,color: TColors.txtbouttongreydark,controller: lienrs3),
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
                                   Text("Réseau Social 4",style: Theme.of(context)
                                       .textTheme
                                       .bodySmall!
                                       .copyWith(
                                       color: TColors.subtitle,
                                       fontSize: 13),),
                                   DropdownButton(
                                     // Initial Value
                                     value: selectedRs4,
                                     hint: const Text("Sélectionner un réseau Social"),
                                     isExpanded: true,
                                     focusColor: TColors.bg,
                                     // Down Arrow Icon
                                     icon: const Icon(Icons.keyboard_arrow_down),

                                     // Array list of items
                                     items: dataRs.map((list) {
                                       return DropdownMenuItem(
                                         value: list['nom_rs'].toString(),
                                         child: Text(list['nom_rs']),
                                       );
                                     }).toList(),
                                     // After selecting the desired option,it will
                                     // change button value to selected value
                                     onChanged: (value) {
                                       setState(() {
                                         selectedRs4 = value;
                                       });
                                     },
                                   ),
                                 ],
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 20.0),
                             child: TextFormFieldWidget(label: "Lien",icon: Icons.link,hintext:"Ajouter lien profil",width: 505,color: TColors.txtbouttongreydark,controller: lienrs4),
                           ),
                         ],
                       ),
                     ),
                   ],
                 ),
                 const SizedBox(
                   height: 10,
                 ),
                 BouttonContact(onPressed1: () {
                   if(_formKey.currentState!.validate()){
                     setState(() {
                       ContactModel contactModel = ContactModel(civilite:civilite ?? "",nom_prenom:nameController.text,image:image ?? "",entreprise:entrepriseController.text ?? "",fonction:fonctionController.text ?? "",date_naissance:date_naissance ?? "",groupe_nom:groupe_nom ?? "",adresse:adresseController.text ?? "",complement_adresse:complementController.text ?? "",
                         code_postal:cpController.text ?? "",ville:villeController.text ?? "",pays:selectedPays ?? "",telephone:telController.text,email:emailController.text ?? "", rs1:selectedRs1 ?? "" , lienrs1:lienrs1.text ?? "",rs2:selectedRs2 ?? "", lienrs2:lienrs2.text ?? "",rs3:selectedRs3 ?? "", lienrs3:lienrs3.text ?? "",rs4:selectedRs4 ?? "", lienrs4:lienrs4.text ?? "",imagedata: jsonEncode(_bytesData));
                       add(contactModel);
                     });
                   }
                 }, onPressed2: () {Navigator.pop(context);}, text: 'Enregistrer',)
               ],
             ),
           ),
         )

        ],
      ),
    );
  }
}

