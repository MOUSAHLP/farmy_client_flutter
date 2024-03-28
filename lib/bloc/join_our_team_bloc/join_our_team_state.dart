// abstract class JoinOurTeamState {}
//
// class JoinOurTeamInit extends JoinOurTeamState {}
//
// class JoinOurTeamSuccess extends JoinOurTeamState {}
// class AddJoinOurTeamSuccess extends JoinOurTeamState {}
//
// class JoinOurTeamLoading extends JoinOurTeamState {}
// class AddJoinOurTeamLoading extends JoinOurTeamState {}
//
// class JoinOurTeamError extends JoinOurTeamState {
//   String error;
//   JoinOurTeamError(this.error);
// }
// class AddJoinOurTeamError extends JoinOurTeamState {
//   String error;
//   AddJoinOurTeamError(this.error);
// }


import 'package:equatable/equatable.dart';

import '../../core/app_enum.dart';

class JoinOurTeamState extends Equatable {
  ScreenStates screenStates;
  bool isLoading;
  bool success;
  String error;
  JoinOurTeamState({
    this.screenStates = ScreenStates.initialized,

    this.isLoading=false,

    this.success=false,
    this.error='',
  });
  JoinOurTeamState copyWith({
    ScreenStates? screenStates,
    bool? isLoading,

    bool? success,

    String? error,


  }){
    return JoinOurTeamState(

      screenStates: screenStates ?? this.screenStates,
      isLoading: isLoading??false,

      error: error??'',

      success: success??false,

    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [
    identityHashCode(this),
    screenStates,
    isLoading,

    success,

    error,
  ];
}

