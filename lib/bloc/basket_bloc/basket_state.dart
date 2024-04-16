part of 'basket_bloc.dart';

class BasketState extends Equatable {
  final List<ProductResponse>? productList;
  final AddToBasketState? addToBasketState;
  final PaymentProcessResponse? paymentProcessResponse;
  final ScreenState? screenState;
  final String? errorMessage;
  final bool isClear;
  final RewardCouponsFixedValueModel? rewardCouponsFixedValueModel;
  final Map<int, bool>? isAdd;
  const BasketState({
    this.productList = const [],
    this.addToBasketState,
    this.errorMessage,
    this.screenState,
    this.paymentProcessResponse,
    this.isClear = false,
    this.rewardCouponsFixedValueModel,
    this.isAdd=const{}
  });

  BasketState copyWith({
    List<ProductResponse>? productList,
    AddToBasketState? addToBasketState,
    ScreenState? screenState,
    String? errorMessage,
    PaymentProcessResponse? paymentProcessResponse,
    bool? isClear,
    RewardCouponsFixedValueModel? rewardCouponsFixedValueModel,
    Map<int, bool>? isAdd
  }) {
    return BasketState(
      errorMessage: errorMessage ?? "",
      paymentProcessResponse:
          paymentProcessResponse ?? this.paymentProcessResponse,
      addToBasketState: addToBasketState ?? addToBasketState,
      productList: productList ?? this.productList,
      screenState: screenState ?? ScreenState.initialized,
      isClear: isClear ?? false,
      rewardCouponsFixedValueModel:
          rewardCouponsFixedValueModel ?? this.rewardCouponsFixedValueModel,
      isAdd: isAdd??this.isAdd
    );
  }

  @override
  List<Object?> get props => [
        identityHashCode(this),
        productList,
        addToBasketState,
        screenState,
        paymentProcessResponse,
        errorMessage,
        isClear,
    rewardCouponsFixedValueModel,
    isAdd

  ];
}
