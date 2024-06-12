import 'package:dartz/dartz.dart';
import 'package:pharma/core/utils/api_const.dart';
import 'package:pharma/data/data_resource/local_resource/data_store.dart';
import 'package:pharma/data/data_resource/remote_resource/api_handler/base_api_client.dart';
import 'package:pharma/models/product_response.dart';

class ProductRepo {
  Future<Either<String, ProductResponse>> getProductDetailsById(int id) {
    return BaseApiClient.get<ProductResponse>(
        url: ApiConst.getProductDetailsById(id),
        queryParameters: {
          'lang': DataStore.instance.lang,
        },
        converter: (e) {
          return ProductResponse.fromJson(e["data"]);
        }
        );
  }
}
