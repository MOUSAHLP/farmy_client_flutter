import '../../models/product_details_response.dart';

abstract class FavoriteEvent {
  FavoriteEvent([List props = const []]) : super();
}

class GetFavorites extends FavoriteEvent {
  GetFavorites();
}

class ChangeFavoriteStatusProduct extends FavoriteEvent {
  final int id;
  ProductResponse productDetailsResponse;
  ChangeFavoriteStatusProduct(
      this.id,
this.productDetailsResponse
      );
}