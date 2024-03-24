import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/rank_bloc/rewards_rank_event.dart';
import 'package:pharma/bloc/rewards_bloc/rank_bloc/rewards_rank_state.dart';
import 'package:pharma/data/repository/rewards_repo.dart';

class RewardsRankAndGuideBloc
    extends Bloc<RewardsRankAndGuideEvent, RewardsRankAndGuideState> {
  RewardsRankAndGuideBloc()
      : super(const RewardsRankAndGuideState(
          rewardsRankAndGuideSuccess: false,
          rewardsRankAndGuideError: '',
          rewardsRankAndGuideLoading: false,
          rewardsRankUserSuccess: false,
          rewardsRankUserError: '',
          rewardsRankUserLoading: false,
        )) {
    on<RewardsRankAndGuideEvent>((event, emit) async {
      if (event is GetRankUserRewards) {
        emit(state.copyWith(rewardsRankUserLoading: true));
        var response = await RewardsRepo.getRewardRankUser();
        response.fold((l) {
          emit(state.copyWith(rewardsRankUserError: l));
        }, (r) {
          emit(state.copyWith(rewardsRankUserSuccess: true, rewardsRankUserModel: r));
        });
      }
      if (event is GetRewardsGuide) {
        emit(state.copyWith(rewardsRankAndGuideLoading: true));
        var response = await RewardsRepo.getRewardGuide();
        response.fold((l) {
          emit(state.copyWith(rewardsRankAndGuideError: l));
        }, (r) {
          emit(state.copyWith(
              rewardsRankAndGuideSuccess: true, rewardGuideModel: r));
        });
      }
      if (event is GetRewardsMemberShipGuide) {
        emit(state.copyWith(rewardsRankAndGuideLoading: true));
        var response = await RewardsRepo.getRewardMemberShipGuide();
        response.fold((l) {
          emit(state.copyWith(rewardsRankAndGuideError: l));
        }, (r) {
          emit(state.copyWith(
              rewardsRankAndGuideSuccess: true, rewardMembershipGuideModel: r));
        });
      }
    });
  }
}
