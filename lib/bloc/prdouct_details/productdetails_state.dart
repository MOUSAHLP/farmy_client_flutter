part of 'productdetails_bloc.dart';

class ProductdetailsState extends Equatable {
  final ScreenState? screenState;
  final ProductDetailsResponse productDetailsResponse;
  final AddToBasketState? addToBasketState;
  final int? quntity;
  final int? quantityRelated;
  final int? quantitySimilar;

  const ProductdetailsState({
    this.screenState,
    this.quantityRelated = 0,
    this.quantitySimilar = 0,
    required this.productDetailsResponse,
    this.addToBasketState,
    this.quntity = 1,
  });

  ProductdetailsState copyWith(
      {ScreenState? screenState,
      final int? quntity,
      final int? quantityRelated,
      final int? quantitySimilar,
      ProductDetailsResponse? productDetailsResponse,
      AddToBasketState? addToBasketState}) {
    return ProductdetailsState(
        quntity: quntity ?? this.quntity,
        quantityRelated: quantityRelated ?? this.quantityRelated,
        quantitySimilar: quantitySimilar ?? this.quantitySimilar,
        screenState: screenState ?? this.screenState,
        productDetailsResponse:
            productDetailsResponse ?? this.productDetailsResponse);
  }

  @override
  List<Object?> get props => [
        identityHashCode(this),
        screenState,
        productDetailsResponse,
        quntity,
        quantityRelated,
        quantitySimilar,
      ];
}
