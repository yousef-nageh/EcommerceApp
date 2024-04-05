
import 'package:shop_app/feature/home/data/models/home_product_model.dart';


abstract class SearchProductStates {}

class SearchProductInitial extends SearchProductStates {}
class SearchProductWaitingState extends SearchProductStates{}
class SearchProductSuccessState extends SearchProductStates{
  final List<ProductListData>  model;

  SearchProductSuccessState(this.model);
}
class SearchProductErrorState extends SearchProductStates{
  final String error;

  SearchProductErrorState(this.error);
}
