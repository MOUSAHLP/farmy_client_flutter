part of 'favorite_bloc.dart';

class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class ToggleFavorite extends FavoriteEvent {
  final bool isFavorite;

  const ToggleFavorite({required this.isFavorite});
}

class GetFavorites extends FavoriteEvent {
  // final bool isFavorite;

  const GetFavorites();
}
