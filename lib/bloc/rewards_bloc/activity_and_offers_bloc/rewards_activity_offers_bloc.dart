import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/activity_and_offers_bloc/rewards_activity_offers_event.dart';
import 'package:pharma/bloc/rewards_bloc/activity_and_offers_bloc/rewards_activity_offers_state.dart';

import 'package:pharma/core/app_enum.dart';
import 'package:pharma/data/repository/rewards_repo.dart';
import 'package:pharma/models/reward/reward_activity_coupons_model.dart';
import 'package:pharma/models/reward/reward_my_coupons_model.dart';

class RewardsActivityAndOffersBloc
    extends Bloc<RewardsActivityAndOffersEvent, RewardsActivityAndOffersState> {
  RewardsActivityStateEnum currentScreen = RewardsActivityStateEnum.activity;
  RewardMyCouponsModel? rewardMyCouponsModel;
  RewardCouponsActivityModel? rewardCouponsActivityModel;

  RewardsActivityAndOffersBloc() : super(RewardsActivityAndOffersInit()) {
    on<RewardsActivityAndOffersEvent>(
      (event, emit) async {
        if (event is GetActivityRewards) {
          emit(RewardsActivityAndOffersLoading());
          var response = await RewardsRepo.getRewardActivity();
          response.fold(
            (l) {
              emit(RewardsActivityAndOffersError(l));
            },
            (r) {
              rewardCouponsActivityModel = r;
              emit(RewardsActivityAndOffersSuccess());
            },
          );
        }
        if (event is GetOffersRewards) {}
        if (event is GetMyCouponRewards) {
          emit(RewardsActivityAndOffersLoading());
          var response = await RewardsRepo.getRewardMyCoupons();
          response.fold(
            (l) {
              emit(RewardsActivityAndOffersError(l));
            },
            (r) {
              rewardMyCouponsModel = r;
              emit(RewardsActivityAndOffersSuccess());
            },
          );
        } else if (event is ChangeTabActivityEvent) {
          currentScreen = event.currentScreen;
          emit(RewardsActivityAndOffersTabChanged());
        }
      },
    );
  }
}
