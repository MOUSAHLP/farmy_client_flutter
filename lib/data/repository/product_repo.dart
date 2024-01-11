import 'package:dartz/dartz.dart';
import 'package:pharma/core/utils/api_const.dart';
import 'package:pharma/data/data_resource/remote_resource/api_handler/base_api_client.dart';
import 'package:pharma/models/product_details_response.dart';

class ProductRepo {
  Future<Either<String, ProductDetailsResponse>> getProductDetailsById(int id) {
    return BaseApiClient.get<ProductDetailsResponse>(
        url: ApiConst.getProductDetailsById(id),
        converter: (e) {
          return ProductDetailsResponse.fromJson(e["data"]);
        });
  }
}
