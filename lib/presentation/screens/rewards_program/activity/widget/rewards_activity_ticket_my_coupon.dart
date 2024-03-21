import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/rewards_bloc/activity_and_offers_bloc/rewards_activity_offers_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/activity_and_offers_bloc/rewards_activity_offers_state.dart';
import 'package:pharma/presentation/screens/rewards_program/activity/widget/rewards_activity_ticket_box.dart';
import 'package:pharma/presentation/screens/rewards_program/activity/widget/rewards_activity_ticket_content.dart';
import 'package:pharma/presentation/widgets/dialogs/loading_dialog.dart';
// not used yet -- need to use NetworkImage to use this field

class RewardsActivityTicketMyCoupon extends StatelessWidget {
  final RewardsActivityAndOffersBloc rewardsActivityAndOffersBloc;

  const RewardsActivityTicketMyCoupon({
    super.key,
    required this.rewardsActivityAndOffersBloc,
  });

  @override
  Widget build(BuildContext context) {
    if(rewardsActivityAndOffersBloc.rewardMyCouponsModel != null) {
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) => RewardsActivityTicketBox(
            text: rewardsActivityAndOffersBloc
                .rewardMyCouponsModel!.data[index].description,
            imageText: rewardsActivityAndOffersBloc
                .rewardMyCouponsModel!.data[index].couponType.name,
            imagePath: rewardsActivityAndOffersBloc
                .rewardMyCouponsModel!.data[index].couponType.image,
            child: RewardsActivityTicketContent(
              code: rewardsActivityAndOffersBloc
                  .rewardMyCouponsModel!.data[index].couponCode,
              codeValidity: "32",
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 5.h,
          ),
          itemCount: 2,
        ),
      );
    } return const SizedBox();
  }
}
