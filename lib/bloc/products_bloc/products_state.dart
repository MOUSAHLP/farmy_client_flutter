part of 'products_bloc.dart';

class ProductsState extends Equatable {
  final ScreenState? screenState;
  List<ProductResponse> productsList = [];
  final Map<int, bool> isAdd;
  ProductsState({this.screenState, this.productsList = const [],this.isAdd=const{}});

  ProductsState copyWith({
    List<ProductResponse>? productsList,
    ScreenState? screenState,

    Map<int, bool>? isAdd
  }) {
    return ProductsState(
      screenState: screenState ?? this.screenState,
      productsList: productsList ?? this.productsList,
      isAdd: isAdd??this.isAdd
    );
  }

  @override
  List<Object?> get props =>
      [identityHashCode(this), screenState, productsList,isAdd];
}
