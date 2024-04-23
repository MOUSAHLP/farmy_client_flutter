import 'package:flutter/material.dart';
import 'package:pharma/bloc/rewards_bloc/activity_and_offers_bloc/rewards_activity_offers_bloc.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/screens/rewards_program/activity/widget/rewards_activity_ticket_box.dart';
import 'package:pharma/presentation/screens/rewards_program/activity/widget/rewards_activity_ticket_buy_content.dart';

class RewardsActivityTicketBuyOffers extends StatelessWidget {
  final RewardsActivityAndOffersBloc rewardsActivityAndOffersBloc;

  const RewardsActivityTicketBuyOffers({
    Key? key,
    required this.rewardsActivityAndOffersBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (rewardsActivityAndOffersBloc.state.rewardsOffersModel != null) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount:
            rewardsActivityAndOffersBloc.state.rewardsOffersModel!.data.length,
        itemBuilder: (context, index) => RewardsActivityTicketBox(
          text: rewardsActivityAndOffersBloc
              .state.rewardsOffersModel!.data[index].description,
          imageText: rewardsActivityAndOffersBloc
              .state.rewardsOffersModel!.data[index].couponType.name,
          imagePath: rewardsActivityAndOffersBloc
              .state.rewardsOffersModel!.data[index].couponType.image,
          child: RewardsActivityTicketBuyContent(
            point: rewardsActivityAndOffersBloc.state.rewardsOffersModel!.data[index].price.toString(),
            idCoupon: rewardsActivityAndOffersBloc.state.rewardsOffersModel!.data[index].id,
          ),
        ),
      );
    }
    return const Center(
      child: CircularProgressIndicator(
        color: ColorManager.primaryGreen,
      ),
    );
  }
}
