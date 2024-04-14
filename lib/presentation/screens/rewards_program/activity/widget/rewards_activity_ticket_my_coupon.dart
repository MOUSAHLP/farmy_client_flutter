import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/rewards_bloc/activity_and_offers_bloc/rewards_activity_offers_bloc.dart';
import 'package:pharma/core/utils/formatter.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/screens/rewards_program/activity/widget/rewards_activity_ticket_box.dart';
import 'package:pharma/presentation/screens/rewards_program/activity/widget/rewards_activity_ticket_content.dart';
// not used yet -- need to use NetworkImage to use this field

class RewardsActivityTicketMyCoupon extends StatelessWidget {
  final RewardsActivityAndOffersBloc rewardsActivityAndOffersBloc;

  const RewardsActivityTicketMyCoupon({
    super.key,
    required this.rewardsActivityAndOffersBloc,
  });

  @override
  Widget build(BuildContext context) {
    if (rewardsActivityAndOffersBloc.state.rewardMyCouponsModel != null) {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => RewardsActivityTicketBox(
          text: rewardsActivityAndOffersBloc.state.rewardMyCouponsModel!.data[index].description,
          imageText: rewardsActivityAndOffersBloc.state.rewardMyCouponsModel!.data[index].couponType.name,
          imagePath: rewardsActivityAndOffersBloc.state.rewardMyCouponsModel!.data[index].couponType.image,
          child: RewardsActivityTicketContent(
            code: rewardsActivityAndOffersBloc
                .state.rewardMyCouponsModel!.data[index].couponCode,
            codeValidity: Formatter.formatDate(
              rewardsActivityAndOffersBloc
                  .state.rewardMyCouponsModel!.data[index].expireAt,
            ),
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: 5.h,
        ),
        itemCount: rewardsActivityAndOffersBloc
            .state.rewardMyCouponsModel!.data.length,
      );
    }
    return const Center(
      child: CircularProgressIndicator(
        color: ColorManager.primaryGreen,
      ),
    );
  }
}
