part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  final ScreenState screenState;
  List<CategoriesResponse> categoriesList = [];
  List<SubCategoryResponse>? subCategoryList;
  bool? isCategoryLoading;

  CategoriesState(
      {this.screenState = ScreenState.initialized,
      this.categoriesList = const [],
      this.subCategoryList,
      this.isCategoryLoading});
  CategoriesState copyWith(
      {List<CategoriesResponse>? categoriesList,
      ScreenState? screenState,
      List<SubCategoryResponse>? subCategoryList,
      bool? isCategoryLoading}) {
    return CategoriesState(
        screenState: screenState ?? this.screenState,
        categoriesList: categoriesList ?? this.categoriesList,
        subCategoryList: subCategoryList ?? this.subCategoryList,
        isCategoryLoading: isCategoryLoading ?? false);
  }

  @override
  List<Object?> get props => [
        identityHashCode(this),
        screenState,
        categoriesList,
        subCategoryList,
        isCategoryLoading
      ];
}
