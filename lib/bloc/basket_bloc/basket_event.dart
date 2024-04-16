
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
 final int id;

 const AddCount(this.id);
}

class MinusCount extends BasketEvent {
 final int id;

 const MinusCount(this.id);
}

class DeleteProduct extends BasketEvent {
 final int id;

const  DeleteProduct(this.id);
}

class ClearBasket extends BasketEvent{}
class SaveBasket extends BasketEvent{}

