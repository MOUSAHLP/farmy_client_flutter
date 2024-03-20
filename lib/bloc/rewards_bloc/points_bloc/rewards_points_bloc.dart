import 'package:bloc/bloc.dart';
import 'package:pharma/bloc/rewards_bloc/points_bloc/rewards_points_event.dart';
import 'package:pharma/bloc/rewards_bloc/points_bloc/rewards_points_state.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/data/repository/rewards_repo.dart';
import 'package:pharma/models/reward/reward_history_model.dart';

class RewardsPointsHistoryBloc
    extends Bloc<RewardsPointsEvent, RewardsPointsHistoryState> {
  RewardsPointsStateEnum currentScreen = RewardsPointsStateEnum.earnedPoints;
  RewardHistoryModel? rewardHistoryModel;

  RewardsPointsHistoryBloc() : super(RewardsPointsInit()) {
    on<RewardsPointsEvent>((event, emit) async {
      if (event is GetRewardsPointsHistoryExpired) {
        emit(RewardsPointsHistoryLoading());
        var response = await RewardsRepo.getRewardHistoryPointsExpired();
        response.fold((l) {
          emit(RewardsPointsHistoryError(l));
        }, (r) {
          rewardHistoryModel = r;
          emit(RewardsPointsHistorySuccess());
        });
      }
      if (event is GetRewardsPointsHistoryUsed) {
        emit(RewardsPointsHistoryLoading());
        var response = await RewardsRepo.getRewardHistoryPointsUsed();
        response.fold((l) {
          emit(RewardsPointsHistoryError(l));
        }, (r) {
          rewardHistoryModel = r;
          emit(RewardsPointsHistorySuccess());
        });
      }
      if (event is GetRewardsPointsHistoryValid) {
        emit(RewardsPointsHistoryLoading());
        var response = await RewardsRepo.getRewardHistoryPointsValid();
        response.fold((l) {
          emit(RewardsPointsHistoryError(l));
        }, (r) {
          rewardHistoryModel = r;
          emit(RewardsPointsHistorySuccess());
        });
      }
      else if (event is ChangeTabPointsRewardsEvent) {
        currentScreen = event.currentScreen;
        emit(RewardsTabPointsHistoryChanged());
      }
    });
  }
}
