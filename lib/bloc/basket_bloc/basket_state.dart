part of 'basket_bloc.dart';

class BasketState extends Equatable {
  final List<ProductDetailsResponse>? prductList;
  final AddToBasketState? addToBasketState;
  final PaymentProcessResponse? paymentProcessResponse;
  final ScreenState? screenState;
  final String? errorMessage;
  final bool isClear;

  const BasketState({
    this.prductList = const [],
    this.addToBasketState,
    this.errorMessage,
    this.screenState,
    this.paymentProcessResponse,
    this.isClear = false,
  });

  BasketState copyWith({
    List<ProductDetailsResponse>? productList,
    AddToBasketState? addToBasketState,
    ScreenState? screenState,
    String? errorMessage,
    PaymentProcessResponse? paymentProcessResponse,
    bool? isClear,
  }) {
    return BasketState(
        errorMessage: errorMessage ?? "",
        paymentProcessResponse:
            paymentProcessResponse ?? this.paymentProcessResponse,
        addToBasketState: addToBasketState ?? addToBasketState,
        prductList: productList ?? this.prductList,
        screenState: screenState ?? ScreenState.initialized,
        isClear: isClear ?? false);
  }

  @override
  List<Object?> get props => [
        identityHashCode(this),
        prductList,
        addToBasketState,
        screenState,
        paymentProcessResponse,
        errorMessage,
        isClear
      ];
}
