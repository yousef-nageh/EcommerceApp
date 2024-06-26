import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/feature/home/data/repositories/home_repo.dart';

import 'search_product_state.dart';

class SearchProductCubit extends Cubit<SearchProductStates> {
  SearchProductCubit(this.homeRepo) : super(SearchProductInitial());
  HomeRepo homeRepo;
static SearchProductCubit getInstance(context)=>BlocProvider.of(context);
  Future<void> postSearchData() async {
    emit(SearchProductWaitingState());
    var result = await homeRepo.getProductData();
    result.fold(
      (error) => emit(
        SearchProductErrorState(error.errorMessage),
      ),
      (productModel) => emit(SearchProductSuccessState(productModel)),
    );
  }
}
