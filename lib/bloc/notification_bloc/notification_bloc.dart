
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/notification_bloc/notification_event.dart';


import '../../core/app_enum.dart';
import '../../data/repository/notification_repository.dart';
import '../../models/notification_model.dart';
import 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  late TabController tabController;
  List<NotificationModel> listNotification=[];
  int index =0;
  NotificationBloc() : super(NotificationState()) {
    on<NotificationEvent>((event, emit) async {
      print("event");
      print(event);
      if (event is GetNotificationList) {
        emit(state.copyWith(screenStates: ScreenStates.loading));
        listNotification.clear();
        final response = await NotificationRepository.getNotifications(event.type);
        response.fold((l) {
          emit(state.copyWith(screenStates: ScreenStates.error));
        }, (r) {
          listNotification=r;
          emit(state.copyWith(screenStates: ScreenStates.success,allTargetGroupsList:r));
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
      // if(event is DeleteNotification){
      //   emit(NotificationDeleteLoading());
      //   listNotification=listNotification;
      //   final response = await NotificationRepository.deleteNotification(event.id);
      //   response.fold((l) {
      //     emit(NotificationDeleteError(l));
      //   }, (r) {
      //
      //     emit(NotificationDeleteSuccess());
      //   });
      // }
      if(event is DeleteNotification){
        emit(state.copyWith(isLoadingDelet: true));
        final response = await NotificationRepository.deleteNotification(event.id);
        response.fold((l) {
          emit(state.copyWith(errorDelet: l));
        }, (r) {
          listNotification.removeWhere((notification) => notification.id == event.id);
          emit(state.copyWith(successDelet: true,allTargetGroupsList: listNotification));
        });
      }


    });
  }
}
