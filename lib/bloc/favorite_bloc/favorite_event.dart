abstract class FavoriteEvent {
  FavoriteEvent([List props = const []]) : super();
}

class GetFavorites extends FavoriteEvent {
  GetFavorites();
}

class ChangeFavoriteStatusRestaurant extends FavoriteEvent {
  final int id;
  ChangeFavoriteStatusRestaurant(
      this.id

      );
}