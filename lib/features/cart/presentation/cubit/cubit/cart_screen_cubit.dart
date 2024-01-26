import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_screen_state.dart';

class CartScreenCubit extends Cubit<CartScreenState> {
  CartScreenCubit() : super(CartScreenInitial());
}
