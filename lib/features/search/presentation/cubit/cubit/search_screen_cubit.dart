import 'package:bloc/bloc.dart';
import 'package:eco_market_app/features/search/domain/entities/product_entity.dart';
import 'package:eco_market_app/features/search/domain/repositories/search_repository.dart';
import 'package:equatable/equatable.dart';

part 'search_screen_state.dart';

class SearchScreenCubit extends Cubit<SearchScreenState> {
  final SearchRepository _searchRepository;
  SearchScreenCubit(this._searchRepository) : super(SearchScreenInitial());

  getProducts({String? productType, String? search}) async {
    emit(SearchScreenLoading());
    try {
      var list = await _searchRepository.getProducts(
          productType: productType, search: search);
      emit(SearchScreenLoaded(products: list));
    } catch (e) {
      emit(SearchScreenFailure());
    }
  }
}
