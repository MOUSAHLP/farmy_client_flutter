import 'package:dartz/dartz.dart';
import 'package:pharma/core/utils/api_const.dart';
import 'package:pharma/data/data_resource/remote_resource/api_handler/base_api_client.dart';
import 'package:pharma/models/home_response.dart';
import 'package:pharma/models/reward/reward_activity_coupons_model.dart';
import 'package:pharma/models/reward/reward_my_coupons_model.dart';
import 'package:pharma/models/reward/reward_guide_model.dart';
import 'package:pharma/models/reward/reward_history_model.dart';
import 'package:pharma/models/reward/reward_membership_guide_model.dart';
import 'package:pharma/models/reward/reward_offers_coupons_model.dart';
import 'package:pharma/models/reward/reward_rank_user_model.dart';

/// TODO Needs to edit
class RewardsRepo {
  static Future<Either<String, HomeResponse>> getHomeData() {
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
          return RewardGuideModel.fromJson(e);
        });
  }

  static Future<Either<String, RewardMembershipGuideModel>>
      getRewardMemberShipGuide() {
    return BaseApiClient.get<RewardMembershipGuideModel>(
        url: ApiConst.getRewardsMemberShipGuide,
        converter: (e) {
          return RewardMembershipGuideModel.fromJson(e);
        });
  }

  static Future<Either<String, RewardHistoryModel>>
      getRewardHistoryPointsExpired() {
    return BaseApiClient.get<RewardHistoryModel>(
        url: ApiConst.getRewardsPointHistoryExpired,
        converter: (e) {
          return RewardHistoryModel.fromJson(e);
        });
  }

  static Future<Either<String, RewardHistoryModel>>   getRewardHistoryPointsUsed() {
    return BaseApiClient.get<RewardHistoryModel>(
        url: ApiConst.getRewardsPointHistoryUsed,
        converter: (e) {
          return RewardHistoryModel.fromJson(e);
        });
  }

  static Future<Either<String, RewardHistoryModel>>
      getRewardHistoryPointsValid() {
    return BaseApiClient.get<RewardHistoryModel>(
        url: ApiConst.getRewardsPointHistoryValid,
        converter: (e) {
          return RewardHistoryModel.fromJson(e);
        });
  }

  static Future<Either<String, RewardMyCouponsModel>> getRewardMyCoupons() {
    return BaseApiClient.get<RewardMyCouponsModel>(
        url: ApiConst.getRewardMyCoupons,
        converter: (e) {
          return RewardMyCouponsModel.fromJson(e);
        });
  }

  static Future<Either<String, RewardCouponsActivityModel>>
      getRewardActivity() {
    return BaseApiClient.get<RewardCouponsActivityModel>(
        url: ApiConst.getRewardActivityCoupons,
        converter: (e) {
          return RewardCouponsActivityModel.fromJson(e);
        });
  }

  static Future<Either<String, RewardsRankUserModel>> getRewardRankUser() {
    return BaseApiClient.get<RewardsRankUserModel>(
        url: ApiConst.getRewardsRankUser,
        converter: (e) {
          return RewardsRankUserModel.fromJson(e);
        });
  }

  static Future<Either<String, RewardsOffersModel>> getRewardOffersCouponUser() {
    return BaseApiClient.get<RewardsOffersModel>(
        url: ApiConst.getRewardsOfferCoupon,
        converter: (e) {
          return RewardsOffersModel.fromJson(e);
        });
  }
}
