// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'basket_bloc.dart';

class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object> get props => [];
}

class AddToBasket extends BasketEvent {
    final List<ProductResponse> product;

  const AddToBasket( {
    required this.product,
  });
}

class PaymentProcess extends BasketEvent {}

class AddCount extends BasketEvent {
  int id;

  AddCount(this.id);
}

class MinusCount extends BasketEvent {
  int id;

  MinusCount(this.id);
}

class DeleteProduct extends BasketEvent {
  int id;

  DeleteProduct(this.id);
}

class ClearBasket extends BasketEvent{}
class SaveBasket extends BasketEvent{}

