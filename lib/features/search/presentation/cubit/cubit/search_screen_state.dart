part of 'search_screen_cubit.dart';

sealed class SearchScreenState extends Equatable {
  const SearchScreenState();

  @override
  List<Object> get props => [];
}

final class SearchScreenInitial extends SearchScreenState {}

final class SearchScreenLoading extends SearchScreenState {}

final class SearchScreenLoaded extends SearchScreenState {
  final List<ProductEntity> products;

  const SearchScreenLoaded({required this.products});
}

final class SearchScreenFailure extends SearchScreenState {}
