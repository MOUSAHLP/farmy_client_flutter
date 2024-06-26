part of 'basket_bloc.dart';

class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object> get props => [];
}

class AddToBasket extends BasketEvent {
  final List<ProductResponse> product;

  const AddToBasket({
    required this.product,
  });
}

class BasketInitState extends BasketEvent {}

class PaymentProcess extends BasketEvent {}

class AddCount extends BasketEvent {
  final int id;
  final ProductResponse? productResponse;

  const AddCount(this.id, this.productResponse);
}

class LongAddCount extends BasketEvent {
  final int id;

  const LongAddCount(this.id);
}

class MinusCount extends BasketEvent {
  final int id;

  const MinusCount(this.id);
}

class DeleteProduct extends BasketEvent {
  final int id;

  const DeleteProduct(this.id);
}

class ClearBasket extends BasketEvent {}

class SaveBasket extends BasketEvent {}

class SaveIdToBasket extends BasketEvent {
  final int id;

  const SaveIdToBasket(this.id);
}

class AddProductToBasket extends BasketEvent {
  final List<ProductResponse> product;

  const AddProductToBasket(this.product);
}
