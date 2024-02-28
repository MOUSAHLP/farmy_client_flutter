import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pharma/bloc/authentication_bloc/authertication_bloc.dart';
import 'package:pharma/bloc/basket_bloc/basket_bloc.dart';
import 'package:pharma/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:pharma/bloc/language_bloc/language_bloc.dart';
import 'package:pharma/bloc/language_bloc/language_state.dart';
import 'package:pharma/bloc/location_bloc/location_bloc.dart';
import 'package:pharma/bloc/setting_bloc/setting_bloc.dart';
import 'package:pharma/bloc/setting_bloc/setting_event.dart';
import 'package:pharma/core/services/services_locator.dart';
import 'package:pharma/presentation/screens/auth_screen/account_screen.dart';
import 'package:pharma/presentation/screens/home_screen/home_screen.dart';
import 'package:pharma/presentation/screens/splash_screen/splash_screen.dart';
import 'package:pharma/translations.dart';
import 'bloc/authentication_bloc/authentication_event.dart';
import 'bloc/authentication_bloc/authentication_state.dart';
import 'bloc/favorite_bloc/favorite_event.dart';
import 'bloc/home_bloc/home_bloc.dart';
import 'bloc/onboarding_bloc/onboarding_bloc.dart';
import 'core/app_enum.dart';
import 'data/data_resource/local_resource/data_store.dart';
import 'presentation/screens/onboarding_screen/onboarding_view.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: MediaQuery.of(context).size,
      builder: (context, ctx) {
        return MultiBlocProvider(

          providers: [
            BlocProvider(
              create: (BuildContext context) =>
                  sl<SettingBloc>()..add(const GetSetting()),
            ),
            BlocProvider(
                create: (BuildContext context) => sl<AuthenticationBloc>()),
            BlocProvider(
              create: (BuildContext context) => sl<LanguageBloc>(),
            ),
            BlocProvider(
              create: (BuildContext context) => sl<LocationBloc>(),
            ),
            BlocProvider(
                create: (BuildContext context) => sl<OnBoardingBloc>()),
            BlocProvider(

              create: (BuildContext context) =>
                  sl<HomeBloc>()..add(GetHomeData()),
            ),
            BlocProvider(
              create: (BuildContext context) => sl<BasketBloc>(),
            ),
            BlocProvider(
              lazy: false,
              create: (BuildContext context) =>
                  sl<FavoriteBloc>()..add( GetFavorites()),
            ),
          ],
          child: OverlaySupport.global(
            child: GestureDetector(
              onTap: () {
                final FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus &&
                    currentFocus.focusedChild != null) {
                  currentFocus.focusedChild?.unfocus();
                  currentFocus.unfocus();
                }
              },
              child: BlocBuilder<LanguageBloc, LanguageState>(
                  builder: (context, state) {
                if (true) {
                  return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: 'Farmy',
                      locale: Locale(DataStore.instance.lang),
                      supportedLocales: AppLocalizations.supportedLocales,
                      localizationsDelegates: const [
                        AppLocalizations.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                      ],
                      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        bloc: sl<AuthenticationBloc>()..add(AppStarted()),
                        builder: (context, state) {
                          switch (state.authenticationScreen) {
                            case AuthenticationScreenStates
                                  .authenticationAuthenticated:
                              return const HomeScreen();

                            case AuthenticationScreenStates
                                  .authenticationUnauthenticated:
                              return const OnBoardingView();

                            case AuthenticationScreenStates
                                  .authenticationLoggedOut:
                              return const AccountScreen();

                            default:
                              return const SplashScreen();
                          }
                        },
                      )
                      // home:  NotificationScreen(),
                      );
                }
              }),
            ),
          ),
        );
      },
    );
  }
}
