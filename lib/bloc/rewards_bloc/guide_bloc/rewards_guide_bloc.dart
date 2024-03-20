import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/privacy_bloc/privacy_event.dart';
import 'package:pharma/bloc/privacy_bloc/privacy_state.dart';
import 'package:pharma/bloc/rewards_bloc/guide_bloc/rewards_guide_event.dart';
import 'package:pharma/bloc/rewards_bloc/guide_bloc/rewards_guide_state.dart';
import 'package:pharma/data/repository/privacy_repo.dart';
import 'package:pharma/data/repository/rewards_repo.dart';
import 'package:pharma/models/privacy_model.dart';
import 'package:pharma/models/reward/reward_guide_model.dart';
import 'package:pharma/models/reward/reward_membership_guide_model.dart';

class RewardsGuideBloc extends Bloc<RewardsGuidsEvent, RewardsGuideState> {
  RewardGuideModel? rewardGuideModel;
  RewardMembershipGuideModel? rewardMembershipGuideModel;

  RewardsGuideBloc() : super(RewardsGuideInit()) {
    on<RewardsGuidsEvent>(
      (event, emit) async {
        if (event is GetRewardsGuide) {
          emit(RewardsGuideLoading());
          var response = await RewardsRepo.getRewardGuide();
          response.fold((l) {
            emit(RewardsGuideError(l));
          }, (r) {
            rewardGuideModel = r;
            emit(RewardsGuideSuccess());
          });
        }
        if (event is GetRewardsMemberShipGuide) {
          emit(RewardsGuideMemberShipLoading());
          var response = await RewardsRepo.getRewardMemberShipGuide();
          response.fold((l) {
            emit(RewardsGuideError(l));
          }, (r) {
            rewardMembershipGuideModel = r;
            emit(RewardsGuideMemberShipSuccess());
          });
        }
      },
    );
  }
}
