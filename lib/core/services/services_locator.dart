import 'package:get_it/get_it.dart';
import 'package:pharma/bloc/authentication_bloc/authertication_bloc.dart';
import 'package:pharma/bloc/home_bloc/home_bloc.dart';
import 'package:pharma/bloc/language_bloc/language_bloc.dart';
import 'package:pharma/bloc/onboarding_bloc/onboarding_bloc.dart';
import 'package:pharma/bloc/payment_bloc/payment_bloc.dart';

import '../../bloc/location_bloc/location_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerLazySingleton(() => AuthenticationBloc());
    sl.registerLazySingleton(() => LanguageBloc());
    sl.registerLazySingleton(
      () => HomeBloc(),
    );
    sl.registerFactory(() => LocationBloc());
    sl.registerFactory<PaymentBloc>(() => PaymentBloc());
    sl.registerLazySingleton(() => OnBoardingBloc());
  }
}
