import 'package:equatable/equatable.dart';

class TrackingEvent extends Equatable {
  const TrackingEvent();

  @override
  List<Object> get props => [];
}

class GetOrderStatus extends TrackingEvent {
  const GetOrderStatus();
}

class UpdateOrderStatus extends TrackingEvent {
  int orderId;
  int status;
  UpdateOrderStatus({required this.orderId, required this.status});
}
