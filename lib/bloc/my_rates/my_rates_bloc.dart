import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/my_rates/my_rates_event.dart';
import 'package:pharma/bloc/my_rates/my_rates_state.dart';
import 'package:pharma/data/repository/my_rates.dart';

class MyRatesBloc extends Bloc<MyRatesEvent, MyRatesState> {
  MyRatesBloc()
      : super(const MyRatesState(
          isSuccess: false,
          isLoading: false,
          error: "",
        )) {
    on<MyRatesEvent>((event, emit) async {
      if (event is GetMyRates) {
        emit(
          state.copyWith(
            isLoading: true,
          ),
        );
        var response = await MyRatesRepo.getShowMyRates();
        response.fold(
          (l) => emit(
            state.copyWith(error: l),
          ),
          (r) => emit(
            state.copyWith(
              getUserRatesModel: r,
              isSuccess: true,
              isLoading: false,
            ),
          ),
        );
      }
    });
  }
}
