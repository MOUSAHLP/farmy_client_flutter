import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/authentication_bloc/authertication_bloc.dart';
import 'package:pharma/bloc/language_bloc/language_bloc.dart';
import 'package:pharma/bloc/language_bloc/language_state.dart';
import 'package:pharma/core/services/services_locator.dart';

import 'package:pharma/presentation/screens/main_screen/main_screen.dart';

import 'package:pharma/translations.dart';

import 'bloc/home_bloc/home_bloc.dart';
import 'bloc/location_bloc/location_bloc.dart';
import 'bloc/onboarding_bloc/onboarding_bloc.dart';

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
      designSize: const Size(100, 100),
      builder: (context, ctx) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (BuildContext context) => sl<AuthenticationBloc>()),
            BlocProvider(
              create: (BuildContext context) => sl<LanguageBloc>(),
            ),
            BlocProvider(
                create: (BuildContext context) => sl<OnBoardingBloc>()),
            BlocProvider(
              create: (BuildContext context) => sl<HomeBloc>(),
            ),
            BlocProvider(
              create: (BuildContext context) => sl<LocationBloc>(),
            ),
          ],
          child: BlocBuilder<LanguageBloc, LanguageState>(
              builder: (context, state) {
            if (true) {
              return const MaterialApp(
                title: 'Farmy',
                locale: Locale("en"),
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],

                home: MainScreen(),
                // home:  NotificationScreen(),
              );
            }
          }),
        );
      },
    );
  }
}
