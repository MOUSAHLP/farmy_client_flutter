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

class AddQuantityToOrder extends ProductdetailsEvent {
   int quantity;
  // int id;

   AddQuantityToOrder(this.quantity);
}

class RemoveQuantityToOrder extends ProductdetailsEvent {
   int quantity;
  // int id;

   RemoveQuantityToOrder(this.quantity);
}
