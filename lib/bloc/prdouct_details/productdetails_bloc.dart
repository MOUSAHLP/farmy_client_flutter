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

  ProductdetailsBloc({required this.productRepo})
      : super(
          ProductdetailsState(
            productDetailsResponse: ProductDetailsResponse(),
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
            (r) => emit(
              state.copyWith(
                  productDetailsResponse: r, screenState: ScreenState.success),
            ),
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
          int index ;
          if (listRelatedProduct.any((element) => element.id == event.relatedProduct.id)) {
            index = listRelatedProduct.indexWhere((element) => element.id == event.relatedProduct.id);
            int tmp = int.parse(listRelatedProduct[index].quantity!);
            tmp++;
            listRelatedProduct[index].quantity = tmp.toString();
            print('========= this Product Already exist =========');
            print("event : ${event.relatedProduct.id}");
            print("listSimilarProduct : ${ listRelatedProduct[index].quantity}");
            print("list : ${listRelatedProduct.firstWhere((element) => element.id == event.relatedProduct.id)}");
          } else {
            event.relatedProduct.quantity ="1";
            listRelatedProduct.add(event.relatedProduct);
            index = listRelatedProduct.indexWhere((element) => element.id == event.relatedProduct.id);
            print('======== add Product ========');
            print("length : ${listRelatedProduct.length}");
            print("event : ${event.relatedProduct.id}");
            print("list : ${listRelatedProduct.firstWhere((element) => element.id == event.relatedProduct.id).id}");
            print("listSimilarProduct : ${ listRelatedProduct[index].quantity}");
            print("event : ${ event.relatedProduct.quantity }");
          }
          emit(
            state.copyWith(listRelatedProduct: listRelatedProduct),
          );
        }
        if (event is AddQuantitySimilarToOrder) {
          int index ;
          if (listSimilarProduct.any((element) => element.id == event.product.id)) {
            index = listSimilarProduct.indexWhere((element) => element.id == event.product.id);
            int tmp = int.parse(listSimilarProduct[index].quantity!);
            tmp++;
            listSimilarProduct[index].quantity = tmp.toString();
            print('========= this Product Already exist =========');
            print("event : ${event.product.id}");
            print("listSimilarProduct : ${ listSimilarProduct[index].quantity}");
            print("list : ${listSimilarProduct.firstWhere((element) => element.id == event.product.id)}");
          } else {
            event.product.quantity ="1";
            listSimilarProduct.add(event.product);
            index = listSimilarProduct.indexWhere((element) => element.id == event.product.id);
            print('======== add Product ========');
            print("length : ${listSimilarProduct.length}");
            print("event : ${event.product.id}");
            print("list : ${listSimilarProduct.firstWhere((element) => element.id == event.product.id).id}");
            print("listSimilarProduct : ${ listSimilarProduct[index].quantity}");
            print("event : ${ event.product.quantity }");
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
          int index ;
          if (listRelatedProduct.any((element) => element.id == event.relatedProduct.id)) {
            index = listRelatedProduct.indexWhere((element) => element.id == event.relatedProduct.id);
            int tmp = int.parse(listRelatedProduct[index].quantity!);
            if(tmp>0) {
              tmp--;
            }
            listRelatedProduct[index].quantity = tmp.toString();
            print('========= this Product Already exist =========');
            print("event : ${event.relatedProduct.id}");
            print("listSimilarProduct : ${ listRelatedProduct[index].quantity}");
            print("list : ${listRelatedProduct.firstWhere((element) => element.id == event.relatedProduct.id)}");
          }

          emit(
            state.copyWith(listRelatedProduct: listRelatedProduct),
          );
        }
        if (event is RemoveQuantitySimilarToOrder) {
          int index ;
          if (listSimilarProduct.any((element) => element.id == event.product.id)) {
            index = listSimilarProduct.indexWhere((element) => element.id == event.product.id);
            int tmp = int.parse(listSimilarProduct[index].quantity!);
            if(tmp>0) {
              tmp--;
            }
            listSimilarProduct[index].quantity = tmp.toString();
            print('========= this Product Already exist =========');
            print("event : ${event.product.id}");
            print("listSimilarProduct : ${ listSimilarProduct[index].quantity}");
            print("list : ${listSimilarProduct.firstWhere((element) => element.id == event.product.id)}");
          }
          emit(
            state.copyWith(listSimilarProduct: listSimilarProduct),
          );
        }
      },
    );
  }
}
