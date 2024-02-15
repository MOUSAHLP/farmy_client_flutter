import 'package:dartz/dartz.dart';
import 'package:pharma/core/utils/api_const.dart';
import 'package:pharma/data/data_resource/remote_resource/api_handler/base_api_client.dart';
import 'package:pharma/models/home_response.dart';

/// it needs to edit
class RewardsRepo {
  Future<Either<String, HomeResponse>> getHomeData() {
    return BaseApiClient.get<HomeResponse>(
        url: ApiConst.getAllRewards,
        converter: (e) {
          return HomeResponse.fromJson(e["data"]);
        });
  }
}
