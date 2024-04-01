import 'package:equatable/equatable.dart';
import 'package:pharma/bloc/my_rates/my_rates_event.dart';
import 'package:pharma/models/get_user_rates_model.dart';

class MyRatesState extends Equatable {
  final bool isSuccess;

  final bool isLoading;

  final String error;

  final GetUserRatesModel? getUserRatesModel;

  const MyRatesState({
    required this.isSuccess,
    required this.isLoading,
    required this.error,
    this.getUserRatesModel,
  });

  MyRatesState copyWith({
    bool? isSuccess,
    bool? isLoading,
    String? error,
    GetUserRatesModel? getUserRatesModel,
  }) {
    return MyRatesState(
      isSuccess: isSuccess ?? this.isSuccess,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      getUserRatesModel: getUserRatesModel ?? this.getUserRatesModel,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        isSuccess,
        isLoading,
        error,
    getUserRatesModel,
      ];
}
