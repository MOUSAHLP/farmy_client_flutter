part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  final ScreenState screenState;
  List<CategoriesResponse> categoriesList = [];

  CategoriesState({
    this.screenState = ScreenState.initialized,
    this.categoriesList = const [],
  });
  CategoriesState copyWith(
      {List<CategoriesResponse>? categoriesList, ScreenState? screenState}) {
    return CategoriesState(
        screenState: screenState ?? this.screenState,
        categoriesList: categoriesList ?? this.categoriesList);
  }

  @override
  List<Object?> get props => [categoriesList];
}
