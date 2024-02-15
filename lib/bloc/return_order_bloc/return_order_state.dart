import 'package:equatable/equatable.dart';

import '../../core/app_enum.dart';

class ReturnOrderState extends Equatable {
  final ScreenState? screenState;

  const ReturnOrderState({this.screenState});

  ReturnOrderState copyWith({ScreenState? screenState}) {
    return ReturnOrderState(screenState: screenState ?? this.screenState);
  }

  @override
  List<Object?> get props => [identityHashCode(this), screenState];
}
