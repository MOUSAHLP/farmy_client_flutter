import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:pharma/core/app_enum.dart';
import 'package:pharma/data/repository/product_repo.dart';
import 'package:pharma/models/product_details_response.dart';

part 'productdetails_event.dart';

part 'productdetails_state.dart';

class ProductdetailsBloc extends Bloc<ProductdetailsEvent, ProductdetailsState> {
  ProductRepo productRepo;
  int quntity = 1;
  int quantityRelated = 0;
  int quantitySimilar = 0;

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
          quantityRelated = event.quantityRelated;
          ++quantityRelated;
          emit(
            state.copyWith(quantityRelated: quantityRelated),
          );
        }
        if (event is AddQuantitySimilarToOrder) {
          quantitySimilar = event.quantitySimilar;
          ++quantitySimilar;
          emit(
            state.copyWith(quantitySimilar: quantitySimilar),
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
          quantityRelated = event.quantityRelated;
          if (quantityRelated > 0) {
            --quantityRelated;
          }
          emit(
            state.copyWith(quantityRelated: quantityRelated),
          );
        }
        if (event is RemoveQuantitySimilarToOrder) {
          quantitySimilar = event.quantitySimilar;
          if (quantitySimilar > 0){
            --quantitySimilar;}

          emit(
            state.copyWith(quantitySimilar: quantitySimilar),
          );
        }
      },
    );
  }
}
