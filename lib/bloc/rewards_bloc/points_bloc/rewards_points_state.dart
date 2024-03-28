import 'package:equatable/equatable.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/models/reward/reward_history_model.dart';
import 'package:pharma/models/reward/reward_history_point_used_model.dart';

class RewardsPointsHistoryState extends Equatable {
  final bool rewardsPointsHistorySuccess;
  final String rewardsPointsHistoryError;
  final bool rewardsPointsHistoryLoading;
  final RewardHistoryModel? rewardHistoryModel;
  final RewardsUsedPointsModel? rewardsUsedPointsModel;
  final RewardsPointsStateEnum rewardsPointsStateEnum;

  const RewardsPointsHistoryState({
    required this.rewardsPointsHistorySuccess,
    required this.rewardsPointsHistoryLoading,
    required this.rewardsPointsHistoryError,
    required this.rewardsPointsStateEnum,
    this.rewardHistoryModel,
    this.rewardsUsedPointsModel,
  });

  RewardsPointsHistoryState copyWith({
    bool? rewardsPointsHistorySuccess,
    bool? rewardsPointsHistoryLoading,
    String? rewardsPointsHistoryError,
    RewardHistoryModel? rewardHistoryModel,
    RewardsUsedPointsModel? rewardsUsedPointsModel,
    RewardsPointsStateEnum? rewardsPointsStateEnum,
  }) {
    return RewardsPointsHistoryState(
      rewardsPointsHistoryLoading:
          rewardsPointsHistoryLoading ?? this.rewardsPointsHistoryLoading,
      rewardsPointsHistorySuccess:
          rewardsPointsHistorySuccess ?? this.rewardsPointsHistorySuccess,
      rewardsPointsHistoryError:
          rewardsPointsHistoryError ?? this.rewardsPointsHistoryError,
      rewardHistoryModel: rewardHistoryModel ?? this.rewardHistoryModel,
      rewardsUsedPointsModel:
          rewardsUsedPointsModel ?? this.rewardsUsedPointsModel,
      rewardsPointsStateEnum:
          rewardsPointsStateEnum ?? this.rewardsPointsStateEnum,
    );
  }

  @override
  List<Object?> get props => [
        rewardsPointsHistorySuccess,
        rewardsPointsHistoryLoading,
        rewardsPointsHistoryError,
        rewardHistoryModel,
        rewardsPointsStateEnum,
        rewardsUsedPointsModel,
      ];
}
