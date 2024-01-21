part of 'main_screen_cubit.dart';

sealed class MainScreenState extends Equatable {
  const MainScreenState();

  @override
  List<Object> get props => [];
}

final class MainScreenInitial extends MainScreenState {}

final class MainScreenLoading extends MainScreenState {}

final class MainScreenLoaded extends MainScreenState {
  final List<CategoryEntity> categories;

  const MainScreenLoaded({required this.categories});
}

final class MainScreenFailure extends MainScreenState {}
