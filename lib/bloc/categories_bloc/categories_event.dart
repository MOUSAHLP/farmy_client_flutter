part of 'categories_bloc.dart';

class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class GetCaegoriesEvent extends CategoriesEvent {}

class AllProductsPageEvent extends CategoriesEvent {}

class GetSubCategoryEvent extends CategoriesEvent {
  final int tabIndex;
  final int categoryId;
  const GetSubCategoryEvent({required this.tabIndex, required this.categoryId});
}

class SubCategoryPageEvent extends CategoriesEvent {
  final int tabIndex;
  const SubCategoryPageEvent({
    required this.tabIndex,
  });
}
