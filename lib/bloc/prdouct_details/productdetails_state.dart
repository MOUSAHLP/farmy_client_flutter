part of 'productdetails_bloc.dart';

class ProductdetailsState extends Equatable {
  final ScreenState? screenState;
  final ProductDetailsResponse productDetailsResponse;
  final AddToBasketState? addToBasketState;
  final int? quntity;
  final String error;
  List<ProductsBySubCategoryIdResponse>? listRelatedProduct;
  List<ProductsBySubCategoryIdResponse>? listSimilarProduct;


  ProductdetailsState({
    this.screenState,
    this.listRelatedProduct,
    this.listSimilarProduct,

    required this.productDetailsResponse,
    this.addToBasketState,
    this.quntity = 1,
    this.error='',
  });

  ProductdetailsState copyWith({
    int? quantityRelate,
    ScreenState? screenState,
    final int? quntity,
    List<ProductsBySubCategoryIdResponse>? listSimilarProduct,
    List<ProductsBySubCategoryIdResponse>? listRelatedProduct,
    String? error,
    ProductDetailsResponse? productDetailsResponse,
    AddToBasketState? addToBasketState,
  }) {
    return ProductdetailsState(
      quntity: quntity ?? this.quntity,
      listRelatedProduct: listRelatedProduct ?? this.listRelatedProduct,
      listSimilarProduct: listSimilarProduct ?? this.listSimilarProduct,
      screenState: screenState ?? this.screenState,
      productDetailsResponse:
          productDetailsResponse ?? this.productDetailsResponse,
      error: error??'',
    );
  }

  @override
  List<Object?> get props => [
        identityHashCode(this),
        screenState,
        productDetailsResponse,
        quntity,
        listRelatedProduct,
        listSimilarProduct,
    error,
      ];
}
