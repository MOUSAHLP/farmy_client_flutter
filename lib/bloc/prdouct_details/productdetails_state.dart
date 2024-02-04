part of 'productdetails_bloc.dart';

class ProductdetailsState extends Equatable {
  final ScreenState? screenState;
  final ProductDetailsResponse productDetailsResponse;
  final AddToBasketState? addToBasketState;
  final int? quntity;

  const ProductdetailsState(
      {this.screenState,
     required this.productDetailsResponse,
      this.addToBasketState,
      this.quntity = 1});

  ProductdetailsState copyWith(
      {ScreenState? screenState,
      final int? quntity,
      ProductDetailsResponse? productDetailsResponse,
      AddToBasketState? addToBasketState}) {
    return ProductdetailsState(
        quntity: quntity ?? this.quntity,
        screenState: screenState ?? this.screenState,
        productDetailsResponse:
            productDetailsResponse ?? this.productDetailsResponse);
  }

  @override
  List<Object?> get props =>
      [identityHashCode(this), screenState, productDetailsResponse, quntity];
}
