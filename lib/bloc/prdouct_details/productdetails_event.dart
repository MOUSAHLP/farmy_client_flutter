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

class RemoveQuntityToOrder extends ProductdetailsEvent {
  final int quntity;

  const RemoveQuntityToOrder(this.quntity);
}
