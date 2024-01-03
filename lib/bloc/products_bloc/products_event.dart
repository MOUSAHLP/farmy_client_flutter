part of 'products_bloc.dart';

class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class GetProductsBySubCategoryId extends ProductsEvent {
  final int id;

 const GetProductsBySubCategoryId({required this.id});

}
