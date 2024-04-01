import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/app/widget/hight_sized_box.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/feature/search_product/presentation/manager/search_product_cubit/search_product_cubit.dart';
import 'package:shop_app/feature/search_product/presentation/manager/search_product_cubit/search_product_state.dart';
import 'package:shop_app/feature/search_product/presentation/widgets/search_item.dart';
import 'package:shop_app/feature/search_product/presentation/widgets/search_product_waiting.dart';


class SearchProductList extends StatelessWidget {
  const SearchProductList({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SearchProductCubit, SearchProductStates>(
      builder: (BuildContext context, state) {
        if (state is SearchProductSuccessState) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 4.hR()),
            itemBuilder: (BuildContext context, int index) => SearchItem(
              model: state.model.data!.products![index],
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const HeightSizedBox( height: 4,),
            itemCount: state.model.data?.products?.length ?? 0,
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
