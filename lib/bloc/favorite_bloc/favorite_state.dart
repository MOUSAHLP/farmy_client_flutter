import '../../models/products_by_sub_category_id_response.dart';

abstract class FavoriteState {}

class FavoritesListLoading extends FavoriteState {}

class FavoritesListError extends FavoriteState {
  String error;
  FavoritesListError(this.error);
}

class FavoritesListSuccess extends FavoriteState {

  FavoritesListSuccess();
}
class AddFavoriteSuccess extends FavoriteState{}
class RemoveFavoriteSuccess extends FavoriteState{}