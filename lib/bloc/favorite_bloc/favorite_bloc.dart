import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/favorite_repository.dart';
import '../../models/products_by_sub_category_id_response.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  List<ProductsBySubCategoryIdResponse> favoriteListProducts = [];
  List<int> idProducts = [];

  bool isFavoriteProduct(int id) {
    bool x = false;
    if (idProducts.any((element) => element == id)) {
      x = true;
      return x;
    }
    return x;
  }

  FavoriteBloc() : super(FavoritesListLoading()) {
    on<FavoriteEvent>((event, emit) async {
      print("===========event");
      print(event);
      if (event is GetFavorites) {
        emit(FavoritesListLoading());
        final response = await FavoriteRepository.getFavoriteList();
        response.fold((l) {
          emit(FavoritesListError(l));
        }, (r) {
          favoriteListProducts = r;
          idProducts =
              favoriteListProducts.map((item) => item.id ?? 0).toList();
          print("idProducts");
          print(idProducts);
          print(idProducts.length);
          emit(FavoritesListSuccess());
        });
      }

      if (event is ChangeFavoriteStatusRestaurant) {
        if (!isFavoriteProduct(event.id)) {
          idProducts.add(event.id);
          emit(RemoveFavoriteSuccess());
          final response = await FavoriteRepository.addFavorite(event.id);
          response.fold((l) {
            idProducts.removeWhere((element) => element == event.id);
            emit(RemoveFavoriteSuccess());
          }, (r) {
            emit(RemoveFavoriteSuccess());
          });
        } else {
          idProducts.removeWhere((element) => element == event.id);
          favoriteListProducts.removeWhere((element) => element.id == event.id);
          emit(RemoveFavoriteSuccess());
          final response = await FavoriteRepository.removeFavorite(event.id);
          response.fold((l) {
            idProducts.add(event.id);
            emit(RemoveFavoriteSuccess());
          }, (r) {
            emit(RemoveFavoriteSuccess());
          });
        }
      }
    });
  }
}
