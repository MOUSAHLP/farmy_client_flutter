import 'package:get_it/get_it.dart';
import 'package:pharma/bloc/authentication_bloc/authertication_bloc.dart';
import 'package:pharma/bloc/basket_bloc/basket_bloc.dart';
import 'package:pharma/bloc/categories_bloc/categories_bloc.dart';
import 'package:pharma/bloc/conditions_bloc/conditions_bloc.dart';
import 'package:pharma/bloc/faq_bloc/faq_bloc.dart';
import 'package:pharma/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:pharma/bloc/home_bloc/home_bloc.dart';
import 'package:pharma/bloc/home_section_all_products_bloc/home_section_all_products_bloc.dart';
import 'package:pharma/bloc/language_bloc/language_bloc.dart';
import 'package:pharma/bloc/onboarding_bloc/onboarding_bloc.dart';
import 'package:pharma/bloc/payment_bloc/payment_bloc.dart';
import 'package:pharma/bloc/prdouct_details/productdetails_bloc.dart';
import 'package:pharma/bloc/privacy_bloc/privacy_bloc.dart';
import 'package:pharma/bloc/products_bloc/products_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/activity_and_offers_bloc/rewards_activity_offers_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/points_bloc/rewards_points_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/rank_bloc/rewards_rank_bloc.dart';
import 'package:pharma/bloc/setting_bloc/setting_bloc.dart';
import 'package:pharma/bloc/tracking_bloc/tracking_bloc.dart';
import 'package:pharma/bloc/who_we_are_bloc/who_we_are_bloc.dart';
import 'package:pharma/data/repository/basket_repo.dart';
import 'package:pharma/data/repository/categories_repo.dart';
import 'package:pharma/data/repository/home_repo.dart';
import 'package:pharma/data/repository/payment_repo.dart';
import 'package:pharma/data/repository/product_repo.dart';
import '../../bloc/details_order_bloc/details_order_bloc.dart';
import '../../bloc/join_our_team_bloc/join_our_team_bloc.dart';
import '../../bloc/location_bloc/location_bloc.dart';
import '../../bloc/my_order_bloc/my_order_bloc.dart';
import '../../bloc/notification_bloc/notification_bloc.dart';
import '../../bloc/profile_bloc/pofile_bloc.dart';
import '../../bloc/rate_bloc/rate_bloc.dart';
import '../../bloc/search_bloc/search_bloc.dart';
import '../../data/repository/user_repository.dart';

final sl = GetIt.instance;

class ServicesLocator {
  static void clearAll() {
    sl.reset();
  }

  void init() {
    sl.registerLazySingleton(() => AuthenticationBloc(sl()));
    sl.registerLazySingleton(() => LanguageBloc());

    //home
    sl.registerLazySingleton(() => HomeRepo());
    sl.registerLazySingleton(
      () => HomeBloc(homeRepo: sl<HomeRepo>()),
    );
    sl.registerLazySingleton(() => LocationBloc());

    /// Home Section All Products Screen
    sl.registerFactory(() => HomeSectionAllProductsBloc());
    sl.registerFactory(() => SearchBloc());
    // setting
    sl.registerLazySingleton(() => SettingBloc());

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
    // sl.registerFactory(() => ProductRelatedBloc(productRepo: sl<ProductRepo>()));

    ///basket
    sl.registerSingleton<BasketRepo>(BasketRepo());
    sl.registerLazySingleton(() => BasketBloc(basketRepo: sl<BasketRepo>()));

    /// favorite
    sl.registerFactory(() => FavoriteBloc());

    ///profile
    sl.registerFactory(() => ProfileBloc());

    ///my order
    sl.registerFactory(() => MyOrderBloc());
    sl.registerFactory(() => DetailsOrderBloc());

    /// Tracking
    sl.registerFactory(() => TrackingBloc());

    ///notification
    sl.registerFactory(() => NotificationBloc());

    /// Rewards
    sl.registerFactory(() => RewardsActivityAndOffersBloc());
    sl.registerFactory(() => RewardsPointsHistoryBloc());
    sl.registerFactory(() => RewardsRankAndGuideBloc());

    /// Rate Screen
    sl.registerFactory(() => RateBloc());

    /// Privacy Policy Screen
    sl.registerFactory(() => PrivacyBloc());

    /// FAQ Screen
    sl.registerFactory(() => FaqBloc());

    /// Conditions Screen
    sl.registerFactory(() => ConditionsBloc());

    /// Who We Are Screen
    sl.registerFactory(() => WhoWeAreBloc());

    ///join our team jobs
    sl.registerFactory(() => JoinOurTeamBloc());
  }
}
