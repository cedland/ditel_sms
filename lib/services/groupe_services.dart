import 'dart:convert';
import 'package:http/http.dart' as http;
import '../classes/groupe_model.dart';

class GroupeService{

  static const ADD_URL = "http://192.168.0.110/ditel_sms_app_php/add_groupe.php";
  static const GET_URL = "http://192.168.0.110/ditel_sms_app_php/get_groupe.php";
  static const UPDATE_URL = "http://192.168.0.110/test/update.php";
  static const DELETE_URL = "http://192.168.0.110/test/delete.php";


  Future<String> addGroupe(GroupeModel groupeModel)async{
    final response = await http.post(Uri.parse(ADD_URL), body: groupeModel.toJsonAdd());
    if(response.statusCode == 200){
      return response.body;
    }else{
      return "error";
    }
  }

  List<GroupeModel> groupeFronJson(String jsonString){
    final data = json.decode(jsonString);
    return List<GroupeModel>.from(data.map((item)=>GroupeModel.fromJson(item)));
  }


  Future<List<GroupeModel>> getGroupe()async{
    final response = await http.get(Uri.parse(GET_URL));
    if(response.statusCode == 200){
      List<GroupeModel> list = groupeFronJson(response.body);
      return list;
    }else{
      return List<GroupeModel>.empty();
    }
  }


Future<String> updateGroupe(GroupeModel groupeModel)async{
    final response = await http.post(Uri.parse(UPDATE_URL), body: groupeModel.toJsonUpdate());
    if(response.statusCode == 200){
      print("Update Response : ${response.body}");
      return response.body;
    }else{
      return "error";
    }
  }
Future<String> deleteGroupe(GroupeModel groupeModel)async{
    final response = await http.post(Uri.parse(DELETE_URL), body: groupeModel.toJsonUpdate());
    if(response.statusCode == 200){
      print("Delete Response : ${response.body}");
      return response.body;
    }else{
      return "error";
    }
  }
}