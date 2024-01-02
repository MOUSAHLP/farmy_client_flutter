part of 'basket_bloc.dart';

class BasketState extends Equatable {
  final List<CompletePaymentParms>? completePaymentParms;
  final AddToBasketState? addToBasketState;
  const BasketState({this.completePaymentParms = const [],this.addToBasketState});

  BasketState copyWith({List<CompletePaymentParms>? completePaymentParms,AddToBasketState? addToBasketState}) {
    return BasketState(
      addToBasketState:addToBasketState ??addToBasketState,
        completePaymentParms:
            completePaymentParms ?? this.completePaymentParms);
  }

  @override
  List<Object?> get props => [completePaymentParms,addToBasketState];
}
