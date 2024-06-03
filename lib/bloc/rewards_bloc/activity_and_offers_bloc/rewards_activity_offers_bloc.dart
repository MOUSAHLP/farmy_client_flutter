import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/activity_and_offers_bloc/rewards_activity_offers_event.dart';
import 'package:pharma/bloc/rewards_bloc/activity_and_offers_bloc/rewards_activity_offers_state.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/data/repository/rewards_repo.dart';
import 'package:pharma/models/params/rewards_by_coupon_params.dart';

class RewardsActivityAndOffersBloc
    extends Bloc<RewardsActivityAndOffersEvent, RewardsActivityAndOffersState> {
  RewardsActivityStateEnum currentScreen = RewardsActivityStateEnum.activity;

  RewardsActivityAndOffersBloc()
      : super(const RewardsActivityAndOffersState(
          rewardsActivityAndOffersHasSuc: false,
          rewardsActivityStateEnum: RewardsActivityStateEnum.activity,
          rewardsActivityAndOffersSuccess: false,
          rewardsActivityAndOffersLoading: false,
          rewardsActivityAndOffersHasError: false,
          rewardsActivityAndOffersError: '',
        )) {
    on<RewardsActivityAndOffersEvent>(
      (event, emit) async {
        if (event is GetActivityRewards) {
          emit(state.copyWith(rewardsActivityAndOffersLoading: true));
          var response = await RewardsRepo.getRewardActivity();
          response.fold(
            (l) {
              emit(
                state.copyWith(
                  rewardsActivityAndOffersError: l,
                ),
              );
            },
            (r) {
              emit(
                state.copyWith(
                  rewardCouponsActivityModel: r,
                  rewardsActivityAndOffersSuccess: true,
                ),
              );
            },
          );
        }

        if (event is BuyCoupon) {
          emit(
            state.copyWith(
              rewardsActivityAndOffersLoading: true,
              rewardsActivityAndOffersHasError: false,
              rewardsActivityAndOffersHasSuc: false,
                rewardsActivityAndOffersByCouponLoading: true,
            ),
          );

          var response = await RewardsRepo.buyCoupon(
              buyCouponParams: event.buyCouponParams);
          response.fold(
            (l) {
              emit(
                state.copyWith(
                  rewardsActivityAndOffersError: l,
                  rewardsActivityAndOffersHasError: true,
                  rewardsActivityAndOffersSuccess: true,
                  rewardsActivityAndOffersByCouponLoading: false,
                ),
              );
              emit(
                state.copyWith(
                  rewardsActivityAndOffersHasError: false,
                  rewardsActivityAndOffersByCouponLoading: false,

                ),
              );
            },
            (r) {
              emit(
                state.copyWith(
                  rewardsActivityAndOffersSuccess: true,
                  rewardsActivityAndOffersHasSuc: true,
                  rewardsActivityAndOffersByCouponLoading: false,

                ),
              );
              emit(
                state.copyWith(
                  rewardsActivityAndOffersHasSuc: false,
                  rewardsActivityAndOffersByCouponLoading: false,

                ),
              );
            },
          );
        }
        if (event is GetOffersRewards) {
          emit(state.copyWith(rewardsActivityAndOffersLoading: true));
          var response = await RewardsRepo.getRewardOffersCouponUser();
          response.fold(
            (l) {
              emit(
                state.copyWith(
                  rewardsActivityAndOffersError: l,
                ),
              );
            },
            (r) {
              emit(
                state.copyWith(
                    rewardsOffersModel: r,
                    rewardsActivityAndOffersSuccess: true),
              );
            },
          );
        }
        if (event is GetMyCouponRewards) {
          emit(
            state.copyWith(
              rewardsActivityAndOffersLoading: true,
            ),
          );
          var response = await RewardsRepo.getRewardMyCoupons();
          response.fold(
            (l) {
              emit(
                state.copyWith(
                  rewardsActivityAndOffersError: l,
                ),
              );
            },
            (r) {
              emit(state.copyWith(
                  rewardMyCouponsModel: r,
                  rewardsActivityAndOffersSuccess: true));
            },
          );
        } else if (event is ChangeTabActivityEvent) {
          currentScreen = event.currentScreen;
          emit(
            state.copyWith(
              rewardsActivityStateEnum: currentScreen,
            ),
          );
        }
      },
    );
  }
}
