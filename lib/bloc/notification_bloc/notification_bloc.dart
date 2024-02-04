
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/notification_bloc/notification_event.dart';


import '../../data/repository/notification_repository.dart';
import 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  late TabController tabController;
  NotificationBloc() : super(NotificationLoading()) {
    on<NotificationEvent>((event, emit) async {
      if (event is GetNotificationList) {
        emit(NotificationLoading());
        final response = await NotificationRepository.getNotifications();
        response.fold((l) {
          emit(NotificationError(l));
        }, (r) {

          emit(NotificationSuccess(r));
        });
      }
      if (event is TapOnPressedNotification) {
        int index = event.index;

        tabController.animateTo(index);

      }

    });
  }
}
