part of 'productdetails_bloc.dart';

class ProductdetailsEvent extends Equatable {
  const ProductdetailsEvent();

  @override
  List<Object> get props => [];
}

class GetProductDetailsById extends ProductdetailsEvent {
  final int id;
  const GetProductDetailsById({required this.id});
}

class AddQuntityToOrder extends ProductdetailsEvent {
  final int quntity;

  const AddQuntityToOrder(this.quntity);
}

class AddQuantityRelatedToOrder extends ProductdetailsEvent {
  final ProductsBySubCategoryIdResponse relatedProduct;
  const AddQuantityRelatedToOrder(this.relatedProduct);

}

class AddQuantitySimilarToOrder extends ProductdetailsEvent {
  final ProductsBySubCategoryIdResponse product;
  const AddQuantitySimilarToOrder(this.product);
}

class RemoveQuntityToOrder extends ProductdetailsEvent {
  final int quntity;

  const RemoveQuntityToOrder(this.quntity);
}

class RemoveQuantityRelatedToOrder extends ProductdetailsEvent {
  final ProductsBySubCategoryIdResponse relatedProduct;

  const RemoveQuantityRelatedToOrder(this.relatedProduct);
}

class RemoveQuantitySimilarToOrder extends ProductdetailsEvent {
  final ProductsBySubCategoryIdResponse product;

  const RemoveQuantitySimilarToOrder(this.product);
}
