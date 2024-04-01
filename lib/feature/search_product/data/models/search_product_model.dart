class SearchProductModel{
  bool ?status;
  SearchProductData? data;

  SearchProductModel.formJson(Map<String,dynamic> json){
    status=json["status"];
    data= json['data'] !=  null? SearchProductData.formJson(json['data']):null;
  }

}
class SearchProductData{
  String ?ad;
  List<SearchProductListData>? data;
  SearchProductData.formJson(Map<String,dynamic> json){
    data=[];
    json["data"].forEach((element) {
      data?.add(SearchProductListData.formJson(element));
    });
    ad=json["ad"];
  }
}

class SearchProductListData{
  int ?id;
  num ?price;
  num ?old_price;
  num ?discount;
  String ?image;
  String ?name;
  String ?description;
  List<dynamic >? images;
  bool ?in_favorites;
  bool ?in_cart;
  SearchProductListData.formJson(Map<String,dynamic> json){
    id=json["id"];
    price=json["price"];
    old_price=json["old_price"];
    discount=json["discount"];
    image=json["image"];
    name=json["name"];
    description=json["description"];
    images=json["images"];
    in_favorites=json["in_favorites"];
    in_cart=json["in_cart"];


  }
}
