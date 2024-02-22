part of 'productdetails_bloc.dart';

class ProductdetailsState extends Equatable {
  final ScreenState? screenState;
  final ProductDetailsResponse productDetailsResponse;
  final AddToBasketState? addToBasketState;
  final int? quantity;

  const ProductdetailsState({
      this.screenState,
     required this.productDetailsResponse,
      this.addToBasketState,
      this.quantity = 1
  });

  ProductdetailsState copyWith({
    ScreenState? screenState,
      final int? quantity,
      ProductDetailsResponse? productDetailsResponse,
      AddToBasketState? addToBasketState
      }) {
    return ProductdetailsState(
        quantity: quantity ?? this.quantity,
        screenState: screenState ?? this.screenState,
        productDetailsResponse: productDetailsResponse ?? this.productDetailsResponse);
  }

  @override
  List<Object?> get props =>
      [identityHashCode(this), screenState, productDetailsResponse, quantity];
}
