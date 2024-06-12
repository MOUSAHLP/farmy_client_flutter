import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pharma/core/utils/api_const.dart';
import 'package:pharma/data/data_resource/local_resource/data_store.dart';
import 'package:pharma/data/data_resource/remote_resource/api_handler/base_api_client.dart';
import 'package:pharma/models/home_page_dynamic_model.dart';
import 'package:pharma/models/home_response.dart';
import 'package:pharma/models/product_response.dart';

import '../../models/params/search_params.dart';

class HomeRepo {
  Future<Either<String, HomeResponse>> getHomeData() {
    return BaseApiClient.get<HomeResponse>(
        url: ApiConst.getHomeData,
        queryParameters: {
          'lang': DataStore.instance.lang,
        },
        converter: (e) {
          return HomeResponse.fromJson(e["data"]);
        });
  }

  Future<Either<String, List<HomePageDynamicModel>>> getHomeDynamicData(
      {int page = 1}) {
    return BaseApiClient.get<List<HomePageDynamicModel>>(
        url: "${ApiConst.getHomeDynamicData}?page=$page",
        queryParameters: {
          'lang': DataStore.instance.lang,
        },
        converter: (e) {
          e["data"].insert(0, {"last_page": e["meta"]["last_page"]});
          return HomePageDynamicModel.fromJsonList(e["data"]!);
        });
  }

  Future<Either<String, List<HomePageDynamicModel>>>
      getHomeDynamicDataPagination(int page) {
    return BaseApiClient.get<List<HomePageDynamicModel>>(
        url: "${ApiConst.getHomeDynamicData}?page=$page",
        queryParameters: {
          'lang': DataStore.instance.lang,
        },
        converter: (e) {
          e["data"].insert(0, {"last_page": e["meta"]["last_page"]});
          return HomePageDynamicModel.fromJsonList(e["data"]!);
        });
  }

  static Future<Either<String, List<ProductResponse>>> getSearchProduct({required GetSearchParams text}) {
    BaseApiClient.getTargetCancelToken.cancel('CancleS');
    BaseApiClient.getTargetCancelToken = CancelToken();
    return BaseApiClient.get<List<ProductResponse>>(
        url: ApiConst.search,
        cancelToken: BaseApiClient.getTargetCancelToken,
        queryParameters: text.toJson(),
        converter: (e) {
          return ProductResponse.listFromJson(e["data"]["data"]);
        });
  }
}
