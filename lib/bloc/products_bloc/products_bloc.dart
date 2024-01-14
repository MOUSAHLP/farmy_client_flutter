import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/data/repository/categories_repo.dart';
import 'package:pharma/models/products_by_sub_category_id_response.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  CategoriesRepo categoriesRepo;
  ProductsBloc({required this.categoriesRepo})
      : super(ProductsState(screenState: ScreenState.initialized)) {
    on<ProductsEvent>((event, emit) async {
      if (event is GetProductsBySubCategoryId) {
        emit(state.copyWith(screenState: ScreenState.loading));
        (await categoriesRepo.getProductsBySubCategoriesId(event.id)).fold((l) {
          if (l != "cancel") {
            emit(state.copyWith(screenState: ScreenState.error));
          }
        }, (r) {
          List<ProductsBySubCategoryIdResponse> mutableProducts = List.from(r);
          mutableProducts.removeWhere(
            (element) {
              return element.id == null;
            },
          );
          emit(state.copyWith(
              screenState: ScreenState.success, productsList: mutableProducts));
        });
      }
    });
  }
}
