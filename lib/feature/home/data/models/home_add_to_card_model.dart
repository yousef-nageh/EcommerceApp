class AddToCardModel{
  bool ?status;
  AddToCardModelData? data;
  AddToCardModel.fromJson(Map<String,dynamic> json){
    status=json["status"];
    data=json["data"] !=null? AddToCardModelData.fromJson(json["data"]):null;
  }
}
class AddToCardModelData{

  List<AddToCardDataList>?cart_items;
  num? sub_total;
  num? total;
  AddToCardModelData.fromJson(Map<String,dynamic> json){
    cart_items=[];
    json["cart_items"].forEach((element) {
      cart_items?.add(AddToCardDataList.fromJson(element));
    });
    sub_total=json["sub_total"];
    total=json["total"];
  }
}
class AddToCardDataList{
  int? id;
  AddToCardDataProduct ?product;
  AddToCardDataList.fromJson(Map<String,dynamic> json){
    id=json["id"];
    product=AddToCardDataProduct.fromJson(json["product"]);



  }
}
class AddToCardDataProduct{
  int? id;
  num ?price;
  num ?old_price;
  num ?discount;
  String ?image;
  String ?name;
  String ?description;
  AddToCardDataProduct.fromJson(Map<String,dynamic> json){
    id=json["id"];
    price=json["price"];
    old_price=json["old_price"];
    discount=json["discount"];
    image=json["image"];
    name=json["name"];
    description=json["description"];


  }
}
