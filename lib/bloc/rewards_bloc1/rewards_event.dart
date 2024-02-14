abstract class RewardsEvent {
  RewardsEvent([List props = const []]) : super();
}

class GetRewards extends RewardsEvent {}

class ChangeTabPointHistoryEvent extends RewardsEvent {
  int tabNumber;
  ChangeTabPointHistoryEvent({required this.tabNumber});
}

class ChangeTabActivityEvent extends RewardsEvent {
  int tabNumber;
  ChangeTabActivityEvent({required this.tabNumber});
}

class IsEditingEvent extends RewardsEvent {
  bool isEditing;
  IsEditingEvent(this.isEditing);
}
