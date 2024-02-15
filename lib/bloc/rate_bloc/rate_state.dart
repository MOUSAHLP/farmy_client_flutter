import 'package:equatable/equatable.dart';

import '../../core/app_enum.dart';

class RateState extends Equatable {
  final ScreenState? screenState;

  const RateState({this.screenState});

  RateState copyWith({ScreenState? screenState}) {
    return RateState(screenState: screenState ?? this.screenState);
  }

  @override
  List<Object?> get props => [identityHashCode(this), screenState];
}
