import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pharma/core/utils/api_const.dart';
import 'package:pharma/models/categories_respoonse.dart';
import 'package:pharma/models/category_by_id_response.dart';
import 'package:pharma/models/products_by_sub_category_id_response.dart';

import '../data_resource/remote_resource/api_handler/base_api_client.dart';

class CategoriesRepo {
  Future<Either<String, List<CategoriesResponse>>> getALLCategories() {
    return BaseApiClient.get<List<CategoriesResponse>>(
        url: ApiConst.getAllCategoties,
        converter: (e) {
          return CategoriesResponse.listFromJson(e["data"]);
        });
  }

  Future<Either<String, CategoryByIdResponse>> getSubCategoryById(int id) {
    BaseApiClient.getTargetCancelToken.cancel("cancel");
    BaseApiClient.getTargetCancelToken = CancelToken();
    return BaseApiClient.get<CategoryByIdResponse>(
        cancelToken: BaseApiClient.getTargetCancelToken,
        url: ApiConst.getSubCategories(id),
        converter: (e) {
          return CategoryByIdResponse.fromJson(e["data"]);
        });
  }

  Future<Either<String, List<ProductsBySubCategoryIdResponse>>>
      getProductsBySubCategoriesId(int id) {
    BaseApiClient.getTargetCancelToken.cancel("cancel");
    BaseApiClient.getTargetCancelToken = CancelToken();
    return BaseApiClient.get<List<ProductsBySubCategoryIdResponse>>(
        cancelToken: BaseApiClient.getTargetCancelToken,
        queryParameters: {"subCategoryId": id},
        url: ApiConst.getProductBySubCategoryId,
        converter: (e) {
          return ProductsBySubCategoryIdResponse.listFromJson(e["data"]);
        });
  }
}
