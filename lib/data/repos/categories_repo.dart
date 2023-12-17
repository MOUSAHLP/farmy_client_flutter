import 'package:dartz/dartz.dart';
import 'package:pharma/core/utils/api_const.dart';
import 'package:pharma/models/parms/categories_respoonse.dart';
import 'package:pharma/models/parms/category_by_id_response.dart';

import '../data_resource/remote_resource/api_handler/base_api_client.dart';

class CategoriesRepo {
  Future<Either<String, List<CategoriesResponse>>> getAllPlan() {
    return BaseApiClient.get<List<CategoriesResponse>>(
        url: ApiConst.getAllCategoties,
        converter: (e) {
          return CategoriesResponse.listFromJson(e["data"]);
        });
  }

  Future<Either<String, CategoryByIdResponse>> getCategoyById(int id) {
    return BaseApiClient.get<CategoryByIdResponse>(
        url: ApiConst.getSubCategories(id),
        converter: (e) {
          return CategoryByIdResponse.fromJson(e["data"]);
        });
  }
}
