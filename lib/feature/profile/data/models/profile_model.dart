class ProfileModel {
  bool? status;
  ProfileModelData? data;
  ProfileModel.fromJson(Map<String,dynamic> json){
    status=json["status"];
    data=ProfileModelData.fromJson(json["data"]);
  }
}

class ProfileModelData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  ProfileModelData.fromJson(Map<String,dynamic> json){
    id=json["id"];
    name=json["name"];
    email=json["email"];
    phone=json["phone"];
    image = json["image"];
  }
}
