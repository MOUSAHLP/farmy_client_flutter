part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  final ScreenState screenState;
  List<CategoriesResponse> categoriesList = [];
  CategoryByIdResponse? categoryByIdResponse;

  CategoriesState(
      {this.screenState = ScreenState.initialized,
      this.categoriesList = const [],
      this.categoryByIdResponse});
  CategoriesState copyWith(
      {List<CategoriesResponse>? categoriesList,
      ScreenState? screenState,
      CategoryByIdResponse? categoryByIdResponse}) {
    return CategoriesState(
        screenState: screenState ?? this.screenState,
        categoriesList: categoriesList ?? this.categoriesList,
        categoryByIdResponse:
            categoryByIdResponse ?? this.categoryByIdResponse);
  }

  @override
  List<Object?> get props => [categoriesList, categoryByIdResponse];
}
