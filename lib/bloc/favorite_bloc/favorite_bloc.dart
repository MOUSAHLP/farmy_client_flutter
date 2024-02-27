import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_enum.dart';
import '../../data/repository/favorite_repository.dart';
import '../../models/products_by_sub_category_id_response.dart';

part 'favorite_event.dart';

part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  // CategoriesRepo categoriesRepo;
  // FavoriteBloc({required this.categoriesRepo})
  FavoriteBloc() : super(FavoriteState(screenState: ScreenState.initialized)) {
    on<FavoriteEvent>((event, emit) async {
      if (event is ToggleFavorite) {
        emit(state.copyWith(isFavorite: event.isFavorite));

        // todo Ghina add request to add and remove favorite
        // emit(state.copyWith(screenState: ScreenState.loading));
        // (await categoriesRepo.getProductsBySubCategoriesId(event.id)).fold((l) {
        //   if (l != "cancel") {
        //     emit(state.copyWith(screenState: ScreenState.error));
        //   }
        // }, (r) {
        //   List<ProductsBySubCategoryIdResponse> mutableProducts = List.from(r);
        //   mutableProducts.removeWhere(
        //     (element) {
        //       return element.id == null;
        //     },
        //   );
        //   emit(state.copyWith(
        //       screenState: ScreenState.success, productsList: mutableProducts));
        // });
      }
      if (event is GetFavorites) {
       emit(state.copyWith(screenState: ScreenState.loading));
        (await FavoriteRepository.getFavoriteList()).fold((l) {
          if (l != "cancel") {
            emit(state.copyWith(screenState: ScreenState.error,error: l));
          }
        }, (r) {
          emit(state.copyWith(
              screenState: ScreenState.success, favoritesList:r ));
        });
      }
    });
  }
}
