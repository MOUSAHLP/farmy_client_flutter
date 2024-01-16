part of 'basket_bloc.dart';

class BasketState extends Equatable {
  final List<ProductDetailsResponse>? prductList;
  final AddToBasketState? addToBasketState;
  final PaymentProcessResponse? paymentProcessResponse;
  final ScreenState? screenState;
  final String? errorMessage;
  const BasketState(
      {this.prductList = const [],
      this.addToBasketState,
      this.errorMessage,
      this.screenState,
      this.paymentProcessResponse});

  BasketState copyWith(
      {List<ProductDetailsResponse>? prductList,
      AddToBasketState? addToBasketState,
      ScreenState? screenState,
      String? errorMessage,
      PaymentProcessResponse? paymentProcessResponse}) {
    return BasketState(
        errorMessage: errorMessage ?? "",
        paymentProcessResponse:
            paymentProcessResponse ?? this.paymentProcessResponse,
        addToBasketState: addToBasketState ?? addToBasketState,
        prductList: prductList ?? this.prductList,
        screenState: screenState ?? ScreenState.initialized);
  }

  @override
  List<Object?> get props => [
        identityHashCode(this),
        prductList,
        addToBasketState,
        screenState,
        paymentProcessResponse,
        errorMessage
      ];
}
