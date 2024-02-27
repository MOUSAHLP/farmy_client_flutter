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
  final int quantityRelated;
  const AddQuantityRelatedToOrder(this.quantityRelated);

}

class AddQuantitySimilarToOrder extends ProductdetailsEvent {
  final int quantitySimilar;

  const AddQuantitySimilarToOrder(this.quantitySimilar);
}

class RemoveQuntityToOrder extends ProductdetailsEvent {
  final int quntity;

  const RemoveQuntityToOrder(this.quntity);
}

class RemoveQuantityRelatedToOrder extends ProductdetailsEvent {
  final int quantityRelated;

  const RemoveQuantityRelatedToOrder(this.quantityRelated);
}

class RemoveQuantitySimilarToOrder extends ProductdetailsEvent {
  final int quantitySimilar;

  const RemoveQuantitySimilarToOrder(this.quantitySimilar);
}
