
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/notification_bloc/notification_event.dart';


import '../../data/repository/notification_repository.dart';
import '../../models/notification_model.dart';
import 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  late TabController tabController;
  List<NotificationModel> listNotification=[];
  int index =0;
  NotificationBloc() : super(NotificationLoading()) {
    on<NotificationEvent>((event, emit) async {
      if (event is GetNotificationList) {
        emit(NotificationLoading());
        listNotification.clear();
        final response = await NotificationRepository.getNotifications(event.type);
        response.fold((l) {
          emit(NotificationError(l));
        }, (r) {
          listNotification=r;
          emit(NotificationSuccess(r));
        });
      }
      if (event is TapOnPressedNotification) {

         index = event.index;
         switch (index) {
           case 0:
             tabController.animateTo(index);
             add(GetNotificationList(3));

             break;
           case 1:
             tabController.animateTo(index);
            add( GetNotificationList(2));
             break;

           default:
             break;
         }

        tabController.animateTo(index);

      }

    });
  }
}
