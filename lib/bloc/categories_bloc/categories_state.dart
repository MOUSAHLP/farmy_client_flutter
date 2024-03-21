part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  final ScreenState screenState;
  int tabIndex = 0;
  List<CategoriesResponse> categoriesList = [];
  List<Widget> tabs = [];
  int previousSubCategoryIndex = 0;
  List<SubCategoryResponse> subCategoryList = [];
  bool? isCategoryLoading;

  CategoriesState(
      {this.screenState = ScreenState.initialized,
      this.tabIndex = 0,
      this.previousSubCategoryIndex = 0,
      this.categoriesList = const [],
      this.subCategoryList = const [],
      this.tabs = const [],
      this.isCategoryLoading = true});

  CategoriesState copyWith({
    int? tabIndex,
    int? previousSubCategoryIndex,
    List<CategoriesResponse>? categoriesList,
    ScreenState? screenState,
    List<Widget>? tabs,
    List<SubCategoryResponse>? subCategoryList,
    bool? isCategoryLoading,
  }) {
    return CategoriesState(
        tabIndex: tabIndex ?? this.tabIndex,
        previousSubCategoryIndex:
            previousSubCategoryIndex ?? this.previousSubCategoryIndex,
        screenState: screenState ?? this.screenState,
        categoriesList: categoriesList ?? this.categoriesList,
        tabs: tabs ?? this.tabs,
        subCategoryList: subCategoryList ?? this.subCategoryList,
        isCategoryLoading: isCategoryLoading ?? false);
  }

  @override
  List<Object?> get props => [
        identityHashCode(this),
        tabIndex,
        previousSubCategoryIndex,
        screenState,
        categoriesList,
        tabs,
        subCategoryList,
        isCategoryLoading
      ];
}
