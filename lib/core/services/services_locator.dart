import 'package:get_it/get_it.dart';
import 'package:pharma/bloc/authentication_bloc/authertication_bloc.dart';
import 'package:pharma/bloc/basket_bloc/basket_bloc.dart';
import 'package:pharma/bloc/categories_bloc/categories_bloc.dart';
import 'package:pharma/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:pharma/bloc/home_bloc/home_bloc.dart';
import 'package:pharma/bloc/language_bloc/language_bloc.dart';
import 'package:pharma/bloc/onboarding_bloc/onboarding_bloc.dart';
import 'package:pharma/bloc/payment_bloc/payment_bloc.dart';
import 'package:pharma/bloc/prdouct_details/productdetails_bloc.dart';
import 'package:pharma/bloc/products_bloc/products_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/activity_bloc/rewards_activity_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/points_bloc/rewards_points_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/rank_bloc/rewards_rank_bloc.dart';
import 'package:pharma/data/repository/basket_repo.dart';
import 'package:pharma/data/repository/categories_repo.dart';
import 'package:pharma/data/repository/home_repo.dart';
import 'package:pharma/data/repository/payment_repo.dart';
import 'package:pharma/data/repository/product_repo.dart';
import '../../bloc/location_bloc/location_bloc.dart';
import '../../bloc/my_order_bloc/my_order_bloc.dart';
import '../../bloc/notification_bloc/notification_bloc.dart';
import '../../bloc/profile_bloc/pofile_bloc.dart';
import '../../data/repository/user_repository.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerLazySingleton(() => AuthenticationBloc(sl()));
    sl.registerLazySingleton(() => LanguageBloc());

    //home
    sl.registerLazySingleton(() => HomeRepo());
    sl.registerLazySingleton(
      () => HomeBloc(homeRepo: sl<HomeRepo>()),
    );
    sl.registerLazySingleton(() => LocationBloc());

    // payment
    sl.registerSingleton<PaymentRepo>(PaymentRepo());
    sl.registerFactory<PaymentBloc>(
        () => PaymentBloc(paymentRepo: sl<PaymentRepo>()));
    sl.registerLazySingleton(() => OnBoardingBloc());
    sl.registerSingleton<CategoriesRepo>(CategoriesRepo());
    sl.registerFactory(
        () => CategoriesBloc(categoriesRepo: sl<CategoriesRepo>()));

    sl.registerLazySingleton<UserRepository>(() => UserRepository());
    sl.registerFactory(
        () => ProductsBloc(categoriesRepo: sl<CategoriesRepo>()));

    /// product
    sl.registerSingleton<ProductRepo>(ProductRepo());
    sl.registerFactory(
        () => ProductdetailsBloc(productRepo: sl<ProductRepo>()));

    ///basket
    sl.registerSingleton<BasketRepo>(BasketRepo());
    sl.registerLazySingleton(() => BasketBloc(basketRepo: sl<BasketRepo>()));

    /// favorite
    sl.registerLazySingleton(() => FavoriteBloc());

    ///profile
    sl.registerFactory(() => ProfileBloc());

    ///my order
    sl.registerFactory(() => MyOrderBloc());

    sl.registerFactory(() => NotificationBloc());

    /// rewards Screen
    sl.registerFactory(() => RewardsPointsBloc());
    sl.registerFactory(() => RewardsActivityBloc());
    sl.registerFactory(() => RewardsRankBloc());
  }
}
