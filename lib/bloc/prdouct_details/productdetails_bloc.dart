import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:pharma/core/app_enum.dart';
import 'package:pharma/data/repository/product_repo.dart';
import 'package:pharma/models/product_details_response.dart';
import 'package:pharma/models/products_by_sub_category_id_response.dart';

part 'productdetails_event.dart';

part 'productdetails_state.dart';

class ProductdetailsBloc extends Bloc<ProductdetailsEvent, ProductdetailsState> {
  ProductRepo productRepo;
  int quntity = 1;
  int quantityRelated = 0;
  int quantitySimilar = 0;
  List<ProductsBySubCategoryIdResponse> listSimilarProduct = [];
  List<ProductsBySubCategoryIdResponse> listRelatedProduct = [];
  List<int> listRelatedProductQuantity = [];
  List<int> listSimilarProductQuantity = [];

  ProductdetailsBloc({required this.productRepo})
      : super(
          ProductdetailsState(
            productDetailsResponse: ProductDetailsResponse(id:0),
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
              state.copyWith(screenState: ScreenState.error),
            ),
            (r) {
              if (r.similarProducts != null) {
                for (var similarProduct in r.similarProducts!) {
                  listSimilarProductQuantity.add(
                    int.parse(similarProduct.quantity!),
                  );
                }
              }
              if (r.relatedProducts != null) {
                for (var relatedProduct in r.relatedProducts!) {
                  listRelatedProductQuantity  .add(
                    int.parse(relatedProduct.quantity!),
                  );
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
            int tmp = int.parse(listRelatedProduct[index].quantity!);
            if (listRelatedProductQuantity[event.index] > tmp) {
              tmp++;
              listRelatedProduct[index].quantity = tmp.toString();
            }
          } else {
            event.relatedProduct.quantity = "1";
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
            int tmp = int.parse(listSimilarProduct[index].quantity!);
            if (listSimilarProductQuantity[event.index] > tmp) {
              tmp++;
              listSimilarProduct[index].quantity = tmp.toString();
            }
          } else {
            event.similarProduct.quantity = "1";
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
            int tmp = int.parse(listRelatedProduct[index].quantity!);
            if (tmp > 0) {
              tmp--;
            }
            listRelatedProduct[index].quantity = tmp.toString();
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
            int tmp = int.parse(listSimilarProduct[index].quantity!);
            if (tmp > 0) {
              tmp--;
            }
            listSimilarProduct[index].quantity = tmp.toString();
          }
          emit(
            state.copyWith(listSimilarProduct: listSimilarProduct),
          );
        }
      },
    );
  }
}
