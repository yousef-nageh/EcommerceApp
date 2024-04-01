class MessageAndStatusModel{
  bool? status;
  String? message;
  MessageAndStatusModel.fromJson(Map<String,dynamic> json){
    status=json["status"];
    message=json["message"];
  }


}