class SignupModel{
bool ? status;
String ?message;
SignupData ?data;
SignupModel.fromJson(Map<String,dynamic> json){
  status=json['status'];
  message=json['message'];
  data=json['data']!= null?SignupData.fromJson(json['data']):null;

}
}

class SignupData{
  String? name;
  String?phone;
   String?email;
   num?id;
  String?image;
  String?token;
  SignupData.fromJson(Map<String,dynamic> json){
    name=json['name'];
    phone=json['phone'];
    email=json['email'];
    id=json['id'];
    image=json['image'];
    token=json['token'];
  }

}