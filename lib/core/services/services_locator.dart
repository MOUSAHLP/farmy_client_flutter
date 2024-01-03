import 'package:get_it/get_it.dart';
import 'package:pharma/bloc/authentication_bloc/authertication_bloc.dart';
import 'package:pharma/bloc/categories_bloc/categories_bloc.dart';
import 'package:pharma/bloc/home_bloc/home_bloc.dart';
import 'package:pharma/bloc/language_bloc/language_bloc.dart';
import 'package:pharma/bloc/onboarding_bloc/onboarding_bloc.dart';
import 'package:pharma/bloc/payment_bloc/payment_bloc.dart';
import 'package:pharma/data/repos/categories_repo.dart';

import '../../bloc/location_bloc/location_bloc.dart';
import '../../bloc/location_first_bloc/location_first_bloc.dart';
import '../../data/repository/user_repository.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerLazySingleton(() => AuthenticationBloc(sl()));
    sl.registerLazySingleton(() => LanguageBloc());
    sl.registerLazySingleton(
      () => HomeBloc(),
    );
    sl.registerLazySingleton(() => LocationBloc());
    sl.registerFactory(() => LocationFirstBloc());
    sl.registerFactory<PaymentBloc>(() => PaymentBloc());
    sl.registerLazySingleton(() => OnBoardingBloc());
    sl.registerSingleton<CategoriesRepo>(CategoriesRepo());
    sl.registerFactory(
        () => CategoriesBloc(categoriesRepo: sl<CategoriesRepo>()));

    sl.registerLazySingleton<UserRepository>(() => UserRepository());
  }
}
