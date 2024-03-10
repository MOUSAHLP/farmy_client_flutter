import 'package:dartz/dartz.dart';
import '../../core/utils/api_const.dart';
import '../../models/product_details_response.dart';
import '../../models/products_by_sub_category_id_response.dart';
import '../data_resource/remote_resource/api_handler/base_api_client.dart';

class FavoriteRepository {
  static Future<Either<String, List<ProductResponse>>> getFavoriteList() {
    return BaseApiClient.get<List<ProductResponse>>(
        url: ApiConst.getFavorite,
        converter: (e) {
          return ProductResponse.listFromJson(e["data"]);
        });
  }
  static Future<Either<String, String>> addFavorite(int idProduct) {
    return BaseApiClient.post<String>(
        queryParameters: {
          "product_id": idProduct,
        },
        url: ApiConst.addFavorite,
        converter: (e) {
          return e.toString();
        });
  }

  static Future<Either<String, String>> removeFavorite(int idProduct) {
    return BaseApiClient.post<String>(
        queryParameters: {
          "product_id": idProduct,
        },
        url: ApiConst.removeFavorite,
        converter: (e) {
          return e.toString();
        });
  }

}
