import 'package:bloc/bloc.dart';
import 'package:pharma/bloc/tracking_bloc/tracking_event.dart';
import 'package:pharma/bloc/tracking_bloc/tracking_state.dart';
import 'package:pharma/data/repository/tracking_repo.dart';
import 'package:pharma/models/track_model.dart';

class TrackingBloc extends Bloc<TrackingEvent, TrackingState> {
  TrackingModel? trackingModel;
  int? orderId;

  TrackingBloc() : super(TrackingInit()) {
    on<TrackingEvent>(
      (event, emit) async {
        if (event is GetOrderStatus && orderId != null) {
          emit(TrackingLoading());
          var response = await TrackingRepo.getTracking(orderId!);
          response.fold(
            (l) {
              emit(TrackingError(l));
            },
            (r) {
              trackingModel = r;
              emit(TrackingSuccess());
            },
          );
        }
        if (event is UpdateOrderStatus && orderId != null) {
          // this if is to prevent refresh another bloc
          if (orderId == event.orderId) {
            emit(TrackingUpdate());

            trackingModel = event.trackingModel;

            emit(TrackingSuccess());
          }
        }
      },
    );
  }

  void setOrderId(int id) {
    orderId = id;
  }
}
