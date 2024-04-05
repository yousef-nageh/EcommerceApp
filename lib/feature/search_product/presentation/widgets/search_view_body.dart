import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/app/widget/my_text_form.dart';
import 'package:shop_app/core/util/constance.dart';

import '../../../../core/util/app_string.dart';
import '../../../../core/util/icon_broken.dart';
import '../manager/search_product_cubit/search_product_cubit.dart';
import '../manager/search_product_cubit/search_product_state.dart';
import 'search_product_list.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        BlocBuilder<SearchProductCubit, SearchProductStates>(builder: (BuildContext context, state) =>  Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: MyTextForm(
            onChanged: (text){
              SearchProductCubit.getInstance(context).postSearchData(text);
            },

              hintText: AppString.searchHintText,
              labelText: AppString.searchLabelText,
              prefixIcon: IconBroken.Search,
              keyboardType: TextInputType.number),
        ),

        ),
        const SizedBox(
          height: 10,
        ),
        const Expanded(child: SearchProductList()),

      ],
    );
  }
}
