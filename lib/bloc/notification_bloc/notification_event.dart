abstract class NotificationEvent {
  NotificationEvent([List props = const []]) : super();
}

class GetNotificationList extends NotificationEvent {
  int type;
  GetNotificationList(this.type);
}
class DeleteNotification extends NotificationEvent {
  int id;
  DeleteNotification(this.id);
}class TapOnPressedNotification extends NotificationEvent {
  int index;
  TapOnPressedNotification(this.index);
}