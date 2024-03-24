import 'package:equatable/equatable.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/models/reward/reward_activity_coupons_model.dart';
import 'package:pharma/models/reward/reward_my_coupons_model.dart';
import 'package:pharma/models/reward/reward_offers_coupons_model.dart';

class RewardsActivityAndOffersState extends Equatable {
  final bool rewardsActivityAndOffersSuccess;
  final String rewardsActivityAndOffersError;
  final bool rewardsActivityAndOffersLoading;
  final RewardMyCouponsModel? rewardMyCouponsModel;
  final RewardCouponsActivityModel? rewardCouponsActivityModel;
  final RewardsOffersModel? rewardsOffersModel;
  final RewardsActivityStateEnum rewardsActivityStateEnum;

  const RewardsActivityAndOffersState({
    required this.rewardsActivityAndOffersSuccess,
    required this.rewardsActivityAndOffersLoading,
    required this.rewardsActivityAndOffersError,
    required this.rewardsActivityStateEnum,
    this.rewardMyCouponsModel,
    this.rewardCouponsActivityModel,
    this.rewardsOffersModel,
  });

  RewardsActivityAndOffersState copyWith({
    bool? rewardsActivityAndOffersSuccess,
    bool? rewardsActivityAndOffersLoading,
    String? rewardsActivityAndOffersError,
    RewardMyCouponsModel? rewardMyCouponsModel,
    RewardCouponsActivityModel? rewardCouponsActivityModel,
    RewardsActivityStateEnum? rewardsActivityStateEnum,
    RewardsOffersModel? rewardsOffersModel,
  }) {
    return RewardsActivityAndOffersState(
      rewardsActivityAndOffersLoading: rewardsActivityAndOffersLoading ??
          this.rewardsActivityAndOffersLoading,
      rewardsActivityAndOffersSuccess: rewardsActivityAndOffersSuccess ??
          this.rewardsActivityAndOffersSuccess,
      rewardsActivityAndOffersError:
          rewardsActivityAndOffersError ?? this.rewardsActivityAndOffersError,
      rewardCouponsActivityModel:
          rewardCouponsActivityModel ?? this.rewardCouponsActivityModel,
      rewardMyCouponsModel: rewardMyCouponsModel ?? this.rewardMyCouponsModel,
      rewardsOffersModel: rewardsOffersModel ?? this.rewardsOffersModel,
      rewardsActivityStateEnum:
          rewardsActivityStateEnum ?? this.rewardsActivityStateEnum,
    );
  }

  @override
  List<Object?> get props => [
        rewardsActivityAndOffersSuccess,
        rewardsActivityAndOffersLoading,
        rewardsActivityAndOffersError,
        rewardMyCouponsModel,
        rewardsOffersModel,
        rewardCouponsActivityModel,
        rewardsActivityStateEnum,
      ];
}
