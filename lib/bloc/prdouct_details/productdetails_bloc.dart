import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:pharma/core/app_enum.dart';
import 'package:pharma/data/repository/product_repo.dart';
import 'package:pharma/models/product_response.dart';


part 'productdetails_event.dart';

part 'productdetails_state.dart';

class ProductdetailsBloc extends Bloc<ProductdetailsEvent, ProductdetailsState> {
  ProductRepo productRepo;
  int quntity = 1;
  int quantityRelated = 0;
  int quantitySimilar = 0;
  List<ProductResponse> listSimilarProduct = [];
  List<ProductResponse> listRelatedProduct = [];
  List<int> listRelatedProductQuantity = [];
  List<int> listSimilarProductQuantity = [];

  ProductdetailsBloc({required this.productRepo})
      : super(
          ProductdetailsState(
            productDetailsResponse: ProductResponse(id:0),
          ),
        ) {
    on<ProductdetailsEvent>(
      (event, emit) async {
        if (event is GetProductDetailsById) {
          emit(
            state.copyWith(screenState: ScreenState.loading),
          );
          (await productRepo.getProductDetailsById(event.id)).fold(
            (l) => emit(
              state.copyWith(screenState: ScreenState.error,error: l),
            ),
            (r) {
              if (r.similarProducts != null) {
                for (var similarProduct in r.similarProducts!) {
                  listSimilarProductQuantity.add(
                  similarProduct.quantity??0)
              ;
                }
              }
              if (r.relatedProducts != null) {
                for (var relatedProduct in r.relatedProducts!) {
                  listRelatedProductQuantity  .add(
                   relatedProduct.quantity??0)
                  ;
                }
              }
              return emit(
                state.copyWith(
                  productDetailsResponse: r,
                  screenState: ScreenState.success,
                ),
              );
            },
          );
        }
        if (event is AddQuntityToOrder) {
          quntity = event.quntity;
          ++quntity;
          emit(
            state.copyWith(quntity: quntity),
          );
        }
        if (event is AddQuantityRelatedToOrder) {
          int index;
          if (listRelatedProduct.any((element) => element.id == event.relatedProduct.id)) {
            index = listRelatedProduct.indexWhere((element) => element.id == event.relatedProduct.id);
            int tmp = listRelatedProduct[index].quantity??0;
            if (listRelatedProductQuantity[event.index] > tmp) {
              tmp++;
              listRelatedProduct[index].quantity = tmp;
            }
          } else {
            event.relatedProduct.quantity =1;
            listRelatedProduct.add(event.relatedProduct);
            index = listRelatedProduct
                .indexWhere((element) => element.id == event.relatedProduct.id);
          }
          emit(
            state.copyWith(listRelatedProduct: listRelatedProduct),
          );
        }
        if (event is AddQuantitySimilarToOrder) {
          int index;
          if (listSimilarProduct
              .any((element) => element.id == event.similarProduct.id)) {
            index = listSimilarProduct
                .indexWhere((element) => element.id == event.similarProduct.id);
            int tmp = listSimilarProduct[index].quantity??0;
            if (listSimilarProductQuantity[event.index] > tmp) {
              tmp++;
              listSimilarProduct[index].quantity = tmp;
            }
          } else {
            event.similarProduct.quantity = 1;
            listSimilarProduct.add(event.similarProduct);
            index = listSimilarProduct
                .indexWhere((element) => element.id == event.similarProduct.id);
          }
          emit(
            state.copyWith(listSimilarProduct: listSimilarProduct),
          );
        }
        if (event is RemoveQuntityToOrder) {
          quntity = event.quntity;
          --quntity;
          if (quntity < 1) quntity = 1;
          emit(
            state.copyWith(quntity: quntity),
          );
        }
        if (event is RemoveQuantityRelatedToOrder) {
          int index;
          if (listRelatedProduct
              .any((element) => element.id == event.relatedProduct.id)) {
            index = listRelatedProduct
                .indexWhere((element) => element.id == event.relatedProduct.id);
            int tmp = listRelatedProduct[index].quantity??0;
            if (tmp > 0) {
              tmp--;
            }
            listRelatedProduct[index].quantity = tmp;
          }

          emit(
            state.copyWith(listRelatedProduct: listRelatedProduct),
          );
        }
        if (event is RemoveQuantitySimilarToOrder) {
          int index;
          if (listSimilarProduct
              .any((element) => element.id == event.product.id)) {
            index = listSimilarProduct
                .indexWhere((element) => element.id == event.product.id);
            int tmp = listSimilarProduct[index].quantity??0;
            if (tmp > 0) {
              tmp--;
            }
            listSimilarProduct[index].quantity = tmp;
          }
          emit(
            state.copyWith(listSimilarProduct: listSimilarProduct),
          );
        }
      },
    );
  }
}
