import 'package:bloc/bloc.dart';
import 'package:pharma/bloc/rewards_bloc/rank_bloc/rewards_rank_event.dart';
import 'package:pharma/bloc/rewards_bloc/rank_bloc/rewards_rank_state.dart';

class RewardsRankBloc extends Bloc<RewardsRankEvent, RewardsRankState> {
  int currentIndex = 1;
  RewardsRankBloc() : super(RewardsRankInit()) {
    on<RewardsRankEvent>((event, emit) async {
      if (event is GetRankRewards) {}
    });
  }
}
