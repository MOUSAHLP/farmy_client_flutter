part of 'productdetails_bloc.dart';

class ProductdetailsState extends Equatable {
  final ScreenState? screenState;
  final ProductDetailsResponse? productDetailsResponse;
  final AddToBasketState? addToBasketState;

  const ProductdetailsState({this.screenState, this.productDetailsResponse,this.addToBasketState});

  ProductdetailsState copyWith(
      {ScreenState? screenState,
      ProductDetailsResponse? productDetailsResponse,
      AddToBasketState? addToBasketState}) {
    return ProductdetailsState(
        screenState: screenState ?? this.screenState,
        productDetailsResponse:
            productDetailsResponse ?? this.productDetailsResponse);
  }

  @override
  List<Object?> get props =>
      [identityHashCode(this), screenState, productDetailsResponse];
}
