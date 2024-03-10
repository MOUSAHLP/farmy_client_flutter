import 'package:dartz/dartz.dart';
import 'package:pharma/core/utils/api_const.dart';
import 'package:pharma/data/data_resource/remote_resource/api_handler/base_api_client.dart';
import 'package:pharma/models/home_response.dart';

import '../../models/banners_response.dart';
import '../../models/categories_respoonse.dart';
import '../../models/endpoint_home_response.dart';
import '../../models/product_details_response.dart';
import '../../models/products_by_sub_category_id_response.dart';

class HomeRepo {
  Future<Either<String, HomeResponse>> getHomeData() {
    return BaseApiClient.get<HomeResponse>(
        url: ApiConst.getHomeDate,
        converter: (e) {
          return HomeResponse.fromJson(e["data"]);
        });
  }

  /// todo Ghina: change ApiConst
  Future<Either<String, List<EndpointHomeResponse>>> getHomeEndpoint() {
    return BaseApiClient.get<List<EndpointHomeResponse>>(
        url: ApiConst.getHomeDate,
        converter: (e) {
          return EndpointHomeResponse.listFromJson(e["data"]);
        });
  }

  /// todo Ghina: change ApiConst
  Future<Either<String, List<CategoriesResponse>>> getCategorySection() {
    return BaseApiClient.get<List<CategoriesResponse>>(
        url: ApiConst.getHomeDate,
        converter: (e) {
          return CategoriesResponse.listFromJson(e["data"]);
        });
  }

  /// todo Ghina: change ApiConst
  Future<Either<String, List<BannersResponse>>> getBannerSection() {
    return BaseApiClient.get<List<BannersResponse>>(
        url: ApiConst.getHomeDate,
        converter: (e) {
          return BannersResponse.listFromJson(e["data"]);
        });
  }

  /// todo Ghina: change ApiConst
  Future<Either<String, List<ProductResponse>>>
      getProductSection() {
    return BaseApiClient.get<List<ProductResponse>>(
        url: ApiConst.getHomeDate,
        converter: (e) {
          return ProductResponse.listFromJson(e["data"]);
        });
  }
}
