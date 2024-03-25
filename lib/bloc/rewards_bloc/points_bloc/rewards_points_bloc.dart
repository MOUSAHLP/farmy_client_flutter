import 'package:bloc/bloc.dart';
import 'package:pharma/bloc/rewards_bloc/points_bloc/rewards_points_event.dart';
import 'package:pharma/bloc/rewards_bloc/points_bloc/rewards_points_state.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/data/repository/rewards_repo.dart';

class RewardsPointsHistoryBloc
    extends Bloc<RewardsPointsEvent, RewardsPointsHistoryState> {
  RewardsPointsStateEnum currentScreen = RewardsPointsStateEnum.earnedPoints;

  RewardsPointsHistoryBloc()
      : super(const RewardsPointsHistoryState(
          rewardsPointsHistorySuccess: false,
          rewardsPointsHistoryLoading: false,
          rewardsPointsHistoryError: '',
          rewardsPointsStateEnum: RewardsPointsStateEnum.earnedPoints,
        )) {
    on<RewardsPointsEvent>((event, emit) async {
      if (event is GetRewardsPointsHistoryExpired) {
        emit(state.copyWith(rewardsPointsHistoryLoading: true));
        var response = await RewardsRepo.getRewardHistoryPointsExpired();
        response.fold(
          (l) {
            emit(
              state.copyWith(rewardsPointsHistoryError: l),
            );
          },
          (r) {
            emit(
              state.copyWith(
                  rewardsPointsHistorySuccess: true, rewardHistoryModel: r),
            );
          },
        );
      }
      if (event is GetRewardsPointsHistoryUsed) {
        emit(
          state.copyWith(rewardsPointsHistoryLoading: true),
        );
        var response = await RewardsRepo.getRewardHistoryPointsUsed();
        response.fold(
          (l) {
            emit(
              state.copyWith(rewardsPointsHistoryError: l),
            );
          },
          (r) {
            emit(
              state.copyWith(
                  rewardsPointsHistorySuccess: true, rewardHistoryModel: r),
            );
          },
        );
      }
      if (event is GetRewardsPointsHistoryValid) {
        emit(
          state.copyWith(rewardsPointsHistoryLoading: true),
        );
        var response = await RewardsRepo.getRewardHistoryPointsValid();
        response.fold(
          (l) {
            emit(
              state.copyWith(rewardsPointsHistoryError: l),
            );
          },
          (r) {
            emit(
              state.copyWith(
                  rewardsPointsHistorySuccess: true, rewardHistoryModel: r),
            );
          },
        );
      }  if(event is ChangeStatusScreen ){
        emit(state.copyWith(rewardsPointsHistorySuccess: false));
      }
      else if (event is ChangeTabPointsRewardsEvent) {
        currentScreen = event.currentScreen;
        emit(
          state.copyWith(rewardsPointsStateEnum: currentScreen),
        );
      }
    });
  }
}
