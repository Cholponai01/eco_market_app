import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'history_screen_state.dart';

class HistoryScreenCubit extends Cubit<HistoryScreenState> {
  HistoryScreenCubit() : super(HistoryScreenInitial());
}
