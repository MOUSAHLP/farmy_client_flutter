import 'package:bloc/bloc.dart';
import 'package:pharma/bloc/rewards_bloc1/rewards_event.dart';
import 'package:pharma/bloc/rewards_bloc1/rewards_state.dart';

class RewardsBloc extends Bloc<RewardsEvent, RewardsState> {
  int pointsHistoryCurrentIndex = 1;
  int activityCurrentIndex = 1;
  RewardsBloc() : super(RewardsInit()) {
    on<RewardsEvent>((event, emit) async {
      if (event is GetRewards) {
      } else if (event is ChangeTabPointHistoryEvent) {
        print(event.tabNumber);
        pointsHistoryCurrentIndex = event.tabNumber;
        emit(RewardsTabPointsHistoryChanged());
      } else if (event is ChangeTabActivityEvent) {
        print(event.tabNumber);
        activityCurrentIndex = event.tabNumber;
        emit(RewardsTabActivityChanged());
      }
    });
  }
}
