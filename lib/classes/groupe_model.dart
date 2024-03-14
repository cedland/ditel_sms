class GroupeModel{
  String? id;
  String? nom_groupe;
  GroupeModel({this.id, this.nom_groupe});



  factory GroupeModel.fromJson(Map<String, dynamic> json){
    return GroupeModel(
      id: json['id'] as String,
      nom_groupe: json['nom_groupe'] as String,
    );
  }
  Map<String, dynamic> toJsonAdd(){
    return{
      "nom_groupe":nom_groupe,
    };
  }
  Map<String, dynamic> toJsonUpdate(){
    return{
      "id":id,
      "nom_groupe":nom_groupe,
    };
  }
}