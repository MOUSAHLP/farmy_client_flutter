import 'package:equatable/equatable.dart';
import 'package:pharma/models/reward/reward_guide_model.dart';
import 'package:pharma/models/reward/reward_membership_guide_model.dart';
import 'package:pharma/models/reward/reward_rank_user_model.dart';

class RewardsRankAndGuideState extends Equatable {
  final RewardGuideModel? rewardGuideModel;
  final RewardMembershipGuideModel? rewardMembershipGuideModel;
  final RewardsRankUserModel? rewardsRankUserModel;
  final bool rewardsRankAndGuideSuccess;
  final String rewardsRankAndGuideError;
  final bool rewardsRankAndGuideLoading;
  final bool rewardsRankUserSuccess;
  final String rewardsRankUserError;
  final bool rewardsRankUserLoading;

  const RewardsRankAndGuideState({
    this.rewardGuideModel,
    this.rewardMembershipGuideModel,
    this.rewardsRankUserModel,
    required this.rewardsRankAndGuideSuccess,
    required this.rewardsRankAndGuideLoading,
    required this.rewardsRankAndGuideError,
    required this.rewardsRankUserSuccess,
    required this.rewardsRankUserError,
    required this.rewardsRankUserLoading,
  });

  RewardsRankAndGuideState copyWith({
    bool? rewardsRankAndGuideSuccess,
    bool? rewardsRankAndGuideLoading,
    String? rewardsRankAndGuideError,
    bool? rewardsRankUserSuccess,
    bool? rewardsRankUserLoading,
    String? rewardsRankUserError,
    RewardGuideModel? rewardGuideModel,
    RewardMembershipGuideModel? rewardMembershipGuideModel,
    RewardsRankUserModel? rewardsRankUserModel,
  }) {
    return RewardsRankAndGuideState(
      rewardsRankAndGuideLoading:
          rewardsRankAndGuideLoading ?? this.rewardsRankAndGuideLoading,
      rewardsRankAndGuideSuccess:
          rewardsRankAndGuideSuccess ?? this.rewardsRankAndGuideSuccess,
      rewardsRankAndGuideError:
          rewardsRankAndGuideError ?? this.rewardsRankAndGuideError,
      rewardsRankUserLoading:
          rewardsRankUserLoading ?? this.rewardsRankUserLoading,
      rewardsRankUserSuccess:
          rewardsRankUserSuccess ?? this.rewardsRankUserSuccess,
      rewardsRankUserError: rewardsRankUserError ?? this.rewardsRankUserError,
      rewardMembershipGuideModel:
          rewardMembershipGuideModel ?? this.rewardMembershipGuideModel,
      rewardGuideModel: rewardGuideModel ?? this.rewardGuideModel,
      rewardsRankUserModel: rewardsRankUserModel ?? this.rewardsRankUserModel,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        rewardMembershipGuideModel,
        rewardGuideModel,
        rewardsRankUserModel,
        rewardsRankAndGuideError,
        rewardsRankAndGuideSuccess,
        rewardsRankAndGuideLoading,
        rewardsRankUserSuccess,
        rewardsRankUserLoading,
        rewardsRankUserError,
      ];
}
