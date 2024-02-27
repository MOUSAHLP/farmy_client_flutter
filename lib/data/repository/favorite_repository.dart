import 'package:dartz/dartz.dart';
import '../../core/utils/api_const.dart';
import '../../models/products_by_sub_category_id_response.dart';
import '../data_resource/remote_resource/api_handler/base_api_client.dart';

class FavoriteRepository {
  static Future<Either<String, List<ProductsBySubCategoryIdResponse>>> getFavoriteList() {
    return BaseApiClient.get<List<ProductsBySubCategoryIdResponse>>(
        url: ApiConst.getFavorite,
        converter: (e) {
          return ProductsBySubCategoryIdResponse.listFromJson(e);
        });
  }

}
