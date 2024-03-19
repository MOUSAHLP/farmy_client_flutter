import 'package:dartz/dartz.dart';
import 'package:pharma/core/utils/api_const.dart';
import 'package:pharma/data/data_resource/remote_resource/api_handler/base_api_client.dart';
import 'package:pharma/models/home_response.dart';
import 'package:pharma/models/reward/reward_guide_model.dart';

/// TODO Needs to edit
class RewardsRepo {

  Future<Either<String, HomeResponse>> getHomeData() {
    return BaseApiClient.get<HomeResponse>(
        url: ApiConst.getAllRewards,
        converter: (e) {
          return HomeResponse.fromJson(e["data"]);
        });
  }

  static Future<Either<String, RewardGuideModel>> getRewardGuide() {
    return BaseApiClient.get<RewardGuideModel>(
        url: ApiConst.getRewardsGuide,
        converter: (e) {
          print('====================================');
          print(RewardGuideModel.fromJson(e).data.html);
          return RewardGuideModel.fromJson(e);
        });
  }
}
