import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/app/widget/hight_sized_box.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/util/app_style.dart';
import 'package:shop_app/feature/search_product/presentation/manager/search_product_cubit/search_product_cubit.dart';
import 'package:shop_app/feature/search_product/presentation/manager/search_product_cubit/search_product_state.dart';
import 'package:shop_app/feature/search_product/presentation/widgets/search_item.dart';
import 'package:shop_app/feature/search_product/presentation/widgets/search_product_waiting.dart';

import '../../../home/data/models/home_product_model.dart';


class SearchProductList extends StatelessWidget {
  const SearchProductList({super.key});
List<ProductListData> voidFilterList(ProductModel model,int limit){
return  model.data?.products?.where((element) =>
  element.price!>=limit
  ).toList()??[];
}
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SearchProductCubit, SearchProductStates>(
      builder: (BuildContext context, state) {
        if (state is SearchProductSuccessState) {
          if(state.model.isEmpty){
            return Center(child: Text("No item found",style: AppStyle.textStyle20,));
          }
          return ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 4.hR()),
            itemBuilder: (BuildContext context, int index) => SearchItem(
              model: state.model[index]
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const HeightSizedBox( height: 4,),
            itemCount: state.model.length  ,
          );
        }else if(state is SearchProductWaitingState){
          return const SearchProductWaiting();
        }else{
          return const SizedBox.shrink();
        }
      },
    );
  }
}
