import 'package:equatable/equatable.dart';

import '../../core/app_enum.dart';
import '../../models/notification_model.dart';



class NotificationState extends Equatable {
  ScreenStates screenStates;
  int indexTap;
  List<NotificationModel> allNotificationList;
  bool isLoadingDelet;
  bool successDelet;
  String errorDelet;

  NotificationState({
    this.screenStates = ScreenStates.loading,
    this.indexTap=0,
    this.allNotificationList=const [],

    this.isLoadingDelet=false,

    this.successDelet=false,
    this.errorDelet='',
  });
  NotificationState copyWith({
    ScreenStates? screenStates,
    int? index,
    List<NotificationModel>? allTargetGroupsList,

    bool? isLoadingDelet,

    bool? successDelet,

    String? errorDelet,


  }){
    return NotificationState(
      screenStates: screenStates ?? this.screenStates,
      indexTap: index ?? indexTap,
      allNotificationList: allTargetGroupsList??allNotificationList,

      isLoadingDelet: isLoadingDelet??false,

      errorDelet: errorDelet??'',

      successDelet: successDelet??false,

    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [
    screenStates,
    indexTap,
    allNotificationList,

    isLoadingDelet,

    successDelet,
    errorDelet
  ];
}

