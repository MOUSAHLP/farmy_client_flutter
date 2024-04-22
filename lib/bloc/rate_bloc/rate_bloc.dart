import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/models/rate_attribute.dart';

import '../../core/app_enum.dart';
import '../../data/repository/my_rates.dart';
import 'rate_event.dart';
import 'rate_state.dart';

class RateBloc extends Bloc<RateEvent, RateState> {

  List<RateAttribute> attributeList = [];
  RateBloc() : super(InitRateState()) {
    on<RateEvent>((event, emit) async {
      if (event is GetRateAttribute) {
        emit(LoadingGetRateAttribute());
        attributeList.clear();
        final response = await MyRatesRepo.getRateAttributes();
        response.fold((l) {
          emit(FailGetRateAttribute(msg: l));
        }, (r) {
          attributeList = r;
          emit(SuccessGetRateAttribute(attributeList: r));
        });
      }
      if (event is SubmitRate) {
        emit(LoadingRateState());
        final response = await MyRatesRepo.submitRate(
            orderId: event.orderId,
            rate: event.rate,
            selectedAttribute: event.selectedAttribute);
        response.fold((l) {
          emit(FailRateState(msg: l));
        }, (r) {
          emit(SuccessRateState(msg: r));
        });
      }
    });
  }
}
