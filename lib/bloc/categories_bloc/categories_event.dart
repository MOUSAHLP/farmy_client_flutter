part of 'categories_bloc.dart';

class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class GetCaegoriesEvent extends CategoriesEvent {}

class GetSubCategoryEvent extends CategoriesEvent {
  final int categoryId;

  const GetSubCategoryEvent({required this.categoryId});
}
