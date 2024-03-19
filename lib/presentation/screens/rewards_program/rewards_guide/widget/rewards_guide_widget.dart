import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:pharma/bloc/rewards_bloc/guide_bloc/rewards_guide_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/guide_bloc/rewards_guide_event.dart';
import 'package:pharma/bloc/rewards_bloc/guide_bloc/rewards_guide_state.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/presentation/screens/rewards_program/rewards_guide/widget/rewards_guide_explain.dart';
import 'package:pharma/presentation/screens/rewards_program/rewards_guide/widget/rewards_guide_note.dart';
import 'package:pharma/presentation/widgets/dialogs/error_dialog.dart';
import 'package:pharma/presentation/widgets/dialogs/loading_dialog.dart';

class RewardsGuideWidget extends StatelessWidget {
  final RewardsGuideBloc _rewardsGuideBloc = RewardsGuideBloc();

  RewardsGuideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    _rewardsGuideBloc.add(GetRewardsGuide());
    return BlocConsumer<RewardsGuideBloc, RewardsGuideState>(
      bloc: _rewardsGuideBloc,
      listener: (context, state) {
        if (state.isLoading) {
          LoadingDialog().openDialog(context);
        }
        if (state.isSuccess) {
          LoadingDialog().closeDialog(context);
        }
      },
      builder: (context, state) {
        if (state.isSuccess) {
          print('================ RewardsGuideWidget ====================');
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: PaddingApp.p20,
                  vertical: PaddingApp.p10,
                ),
                child:
                    HtmlWidget(_rewardsGuideBloc.rewardGuideModel!.data.html),
              )
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
