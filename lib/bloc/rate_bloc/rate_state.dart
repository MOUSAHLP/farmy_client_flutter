import 'package:equatable/equatable.dart';
import 'package:pharma/models/rate_attribute.dart';

import '../../core/app_enum.dart';

class RateState  {
  // final ScreenState? screenState;
  //
  // const RateState({this.screenState});
  //
  // RateState copyWith({ScreenState? screenState}) {
  //   return RateState(screenState: screenState ?? this.screenState);
  // }
  //
  // @override
  // List<Object?> get props => [identityHashCode(this), screenState];
}
class InitRateState extends RateState{}

class LoadingRateState extends RateState{}
class FailRateState extends RateState{
  final String? msg;
  FailRateState({this.msg});
}
class SuccessRateState extends RateState{
  final String? msg;
  SuccessRateState({this.msg});
}

class LoadingGetRateAttribute extends RateState{}
class FailGetRateAttribute extends RateState{
  final String? msg;
  FailGetRateAttribute({this.msg});
}
class SuccessGetRateAttribute extends RateState{
  List<RateAttribute>? attributeList;
  SuccessGetRateAttribute({this.attributeList});
}
