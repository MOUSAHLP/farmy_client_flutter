part of 'productdetails_bloc.dart';

class ProductdetailsState extends Equatable {
  final ScreenState? screenState;
  final ProductDetailsResponse? productDetailsResponse;

  const ProductdetailsState({this.screenState, this.productDetailsResponse});

  ProductdetailsState copyWith(
      {ScreenState? screenState,
      ProductDetailsResponse? productDetailsResponse}) {
    return ProductdetailsState(
        screenState: screenState ?? this.screenState,
        productDetailsResponse:
            productDetailsResponse ?? this.productDetailsResponse);
  }

  @override
  List<Object?> get props => [screenState, productDetailsResponse];
}
