import 'dart:convert';
import 'package:http/http.dart' as http;
import '../classes/contact_model.dart';

class ContactService{

  static const ADD_URL = "http://192.168.0.110/ditel_sms_app_php/add_contact.php";
  static const GET_URL = "http://192.168.0.110/ditel_sms_app_php/get_contact.php";
  static const UPDATE_URL = "http://192.168.0.110/ditel_sms_app_php/update_contact.php";
  static const DELETE_URL = "http://192.168.0.110/ditel_sms_app_php/delete.php";


  /*Future<String> addContact(ContactModel contactModel)async{
    final response = await http.post(Uri.parse(ADD_URL), body: contactModel.toJsonAdd());
    if(response.statusCode == 200){
      return response.body;
    }else{
      return "error";
    }
  }*/

  Future<String> addContact(ContactModel contactModel)async{
    final response = await http.post(Uri.parse(ADD_URL), body:contactModel.toJsonAdd());
    if(response.statusCode == 200){
      return response.body;
    }else{
      return "error";
    }
  }

  List<ContactModel> contactFronJson(String jsonString){
    final data = json.decode(jsonString);
    return List<ContactModel>.from(data.map((item)=>ContactModel.fromJson(item)));
  }


  Future<List<ContactModel>> getContact()async{
    final response = await http.get(Uri.parse(GET_URL));
    if(response.statusCode == 200){
      List<ContactModel> list = contactFronJson(response.body);
      return list;
    }else{
      return List<ContactModel>.empty();
    }
  }


  Future<String> updateContact(ContactModel contactModel)async{
    final response = await http.post(Uri.parse(UPDATE_URL), body: contactModel.toJsonUpdate());
    if(response.statusCode == 200){
      print("Update Response : ${response.body}");
      return response.body;
    }else{
      return "error";
    }
  }
  Future<String> deleteGroupe(ContactModel contactModel)async{
    final response = await http.post(Uri.parse(DELETE_URL), body: contactModel.toJsonUpdate());
    if(response.statusCode == 200){
      print("Delete Response : ${response.body}");
      return response.body;
    }else{
      return "error";
    }
  }
}