class ContactModel{
  String? id;
  String? civilite;
  String? nom_prenom;
  String? image;
  String? entreprise;
  String? fonction;
  String? date_naissance;
  String? groupe_nom;
  String? adresse;
  String? complement_adresse;
  String? code_postal;
  String? ville;
  String? pays;
  String? telephone;
  String? email;
  String? rs1;
  String? lienrs1;
  String? rs2;
  String? lienrs2;
  String? rs3;
  String? lienrs3;
  String? rs4;
  String? lienrs4;
  String? imagedata;


  ContactModel({this.id,this.civilite,this.nom_prenom,this.image,this.entreprise,this.fonction,this.date_naissance,this.groupe_nom,this.adresse,this.complement_adresse,
  this.code_postal,this.ville,this.pays,this.telephone,this.email, this.rs1, this.lienrs1,this.rs2, this.lienrs2,this.rs3, this.lienrs3,this.rs4, this.lienrs4, this.imagedata});


  factory ContactModel.fromJson(Map<String, dynamic> json){
    return ContactModel(
             id: json['id'] as String,
             civilite: json['civilite'] as String,
             nom_prenom:json['nom_prenom'] as String,
             image:json['image'] as String,
             entreprise:json['entreprise'] as String,
             fonction:json['fonction'] as String,
             date_naissance:json['date_naissance'] as String,
             groupe_nom:json['groupe_nom'] as String,
             adresse:json['adresse'] as String,
             complement_adresse:json['complement_adresse'] as String,
             code_postal:json['code_postal'] as String,
             ville:json['ville'] as String,
             pays:json['pays'] as String,
             telephone:json['telephone'] as String,
             email:json['email'] as String,
             rs1:json['rs1'] as String,
             lienrs1:json['lienrs1'] as String,
             rs2:json['rs2'] as String,
             lienrs2:json['lienrs2'] as String,
             rs3:json['rs3'] as String,
             lienrs3:json['lienrs3'] as String,
             rs4:json['rs1'] as String,
             lienrs4:json['lienrs4'] as String,
    );
  }


  Map<String, dynamic>toJsonAdd(){
    return {
      "civilite":civilite,
      "nom_prenom":nom_prenom,
      "image":image,
      "entreprise":entreprise,
      "fonction":fonction,
      "date_naissance":date_naissance,
      "groupe_nom":groupe_nom,
      "adresse":adresse,
      "complement_adresse":complement_adresse,
      "code_postal":code_postal,
      "ville":ville,
      "pays":pays,
      "telephone":telephone,
      "email":email,
      "rs1":rs1,
      "lienrs1":lienrs1,
      "rs2":rs2,
      "lienrs2":lienrs2,
      "rs3":rs3,
      "lienrs3":lienrs3,
      "rs4":rs4,
      "lienrs4":lienrs4,
      "imagedata":imagedata
    };
  }
  Map<String, dynamic> toJsonUpdate(){
    return{
      "id":id,
      "civilite":civilite,
      "nom_prenom":nom_prenom,
      "image":image,
      "entreprise":entreprise,
      "fonction":fonction,
      "date_naissance":date_naissance,
      "groupe_nom":groupe_nom,
      "adresse":adresse,
      "complement_adresse":complement_adresse,
      "code_postal":code_postal,
      "ville":ville,
      "pays":pays,
      "telephone":telephone,
      "email":email,
      "rs1":rs1,
      "lienrs1":lienrs1,
      "rs2":rs2,
      "lienrs2":lienrs2,
      "rs3":rs3,
      "lienrs3":lienrs3,
      "rs4":rs4,
      "lienrs4":lienrs4,
    };
  }

}