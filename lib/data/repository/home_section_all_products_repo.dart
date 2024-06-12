import 'package:dartz/dartz.dart';
import 'package:pharma/core/utils/api_const.dart';
import 'package:pharma/data/data_resource/local_resource/data_store.dart';
import 'package:pharma/data/data_resource/remote_resource/api_handler/base_api_client.dart';
import 'package:pharma/models/product_response.dart';

class HomeSectionAllProductsRepo {
  static Future<Either<String, List<ProductResponse>>> getHomeAllProductById(
      int id) {
    return BaseApiClient.get<List<ProductResponse>>(
        url: ApiConst.getHomeAllProductById(id),
        queryParameters: {
          'lang': DataStore.instance.lang,
        },
        converter: (e) {
          return ProductResponse.listFromJson(e);
        });
  }
}
