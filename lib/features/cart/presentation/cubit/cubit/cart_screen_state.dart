part of 'cart_screen_cubit.dart';

sealed class CartScreenState extends Equatable {
  const CartScreenState();

  @override
  List<Object> get props => [];
}

final class CartScreenInitial extends CartScreenState {}

final class CartScreenLoading extends CartScreenState {}

final class CartScreenLoaded extends CartScreenState {
  final List<OrderEntity> orders;
  const CartScreenLoaded({required this.orders});
}

final class CartScreenFailure extends CartScreenState {}
