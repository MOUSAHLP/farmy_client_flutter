import 'package:bloc/bloc.dart';
import 'package:pharma/bloc/rewards_bloc/points_bloc/rewards_points_event.dart';
import 'package:pharma/bloc/rewards_bloc/points_bloc/rewards_points_state.dart';
import 'package:pharma/core/app_enum.dart';

class RewardsPointsBloc extends Bloc<RewardsPointsEvent, RewardsPointsState> {
  RewardsPointsStateEnum currentScreen = RewardsPointsStateEnum.earnedPoints;

  RewardsPointsBloc() : super(RewardsPointsInit()) {
    on<RewardsPointsEvent>((event, emit) async {
      if (event is GetPointsRewards) {
      } else if (event is ChangeTabPointsRewardsEvent) {
        currentScreen = event.currentScreen;
        emit(RewardsTabPointsHistoryChanged());
      }
    });
  }

  void test() {
    print("test inside points bloc");
  }
}
