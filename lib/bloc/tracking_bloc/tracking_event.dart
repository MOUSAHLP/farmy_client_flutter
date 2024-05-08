import 'package:equatable/equatable.dart';
import 'package:pharma/models/track_model.dart';

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
  TrackingModel trackingModel;
  UpdateOrderStatus({required this.orderId, required this.trackingModel});
}

class GetVerifyCode extends TrackingEvent {
  int orderId;
  GetVerifyCode({required this.orderId});
}
