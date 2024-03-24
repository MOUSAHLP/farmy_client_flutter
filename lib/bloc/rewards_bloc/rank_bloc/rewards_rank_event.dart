abstract class RewardsRankAndGuideEvent {
  RewardsRankAndGuideEvent([List props = const []]) : super();
}

class GetRankUserRewards extends RewardsRankAndGuideEvent {}

class GetRewardsGuide extends RewardsRankAndGuideEvent {}

class GetRewardsMemberShipGuide extends RewardsRankAndGuideEvent {}
