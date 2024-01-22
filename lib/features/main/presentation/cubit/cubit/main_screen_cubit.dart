import 'package:bloc/bloc.dart';
import 'package:eco_market_app/features/main/domain/entities/category_entity.dart';
import 'package:eco_market_app/features/main/domain/repositories/main_repository.dart';
import 'package:equatable/equatable.dart';

part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  final MainRepository _mainRepository;
  MainScreenCubit(this._mainRepository) : super(MainScreenInitial());

  getCategories() async {
    emit(MainScreenLoading());
    try {
      var list = await _mainRepository.getCategories();
      emit(MainScreenLoaded(categories: list));
    } catch (e) {
      emit(MainScreenFailure());
    }
  }
}
