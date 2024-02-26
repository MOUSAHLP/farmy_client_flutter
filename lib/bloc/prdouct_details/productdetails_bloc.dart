import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/data/repository/product_repo.dart';
import 'package:pharma/models/product_details_response.dart';
part 'productdetails_event.dart';
part 'productdetails_state.dart';

class ProductdetailsBloc extends Bloc<ProductdetailsEvent, ProductdetailsState> {
  ProductRepo productRepo;
  int quantity = 1;
  List<dynamic> listProduct = [];

    countsProducts(int id) {
    if (listProduct.any((element) => element.id == id)) {
      int index =
      listProduct.indexWhere((element) => element.id == id);
      return listProduct[index].quantity;
    }
    return 0;
  }
  ProductdetailsBloc({required this.productRepo})
      : super( ProductdetailsState(productDetailsResponse: ProductDetailsResponse())) {
    on<ProductdetailsEvent>((event, emit) async {
      if (event is GetProductDetailsById) {
        emit(state.copyWith(screenState: ScreenState.loading));
        (await productRepo.getProductDetailsById(event.id)).fold(
            (l) => emit(state.copyWith(screenState: ScreenState.error)),
            (r) {
              listProduct =List.filled(r.relatedProducts!.length, 0);
                return  emit(state.copyWith(productDetailsResponse: r,
                    screenState: ScreenState.success
                ));
            }
        );
      }
      if (event is AddQuantityToOrder) {
         quantity = event.quantity;
         ++quantity;
         emit(state.copyWith(quantity: quantity));
      }
      if (event is RemoveQuantityToOrder) {
        quantity = event.quantity;
        --quantity;
        if (quantity < 1) quantity = 1;
        emit(state.copyWith(quantity: quantity));
      }


      if (event is AddQuantityFromRelatedToOrder) {
        if (countsProducts(event.id) == 0) {
          listProduct.add(ProductDetailsResponse(
              id: event.id, quantity: 1));
        } else {
          int index = listProduct.indexWhere((element) => element.id == event.id);
            listProduct[index].quantity++;
        //  quantity;
        }
       emit(state.copyWith(quantity: quantity));
      }
    });
  }
}
