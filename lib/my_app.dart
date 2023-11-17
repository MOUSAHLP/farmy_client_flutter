import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/authentication_bloc/authertication_bloc.dart';
import 'package:pharma/bloc/language_bloc/language_bloc.dart';
import 'package:pharma/bloc/language_bloc/language_state.dart';
import 'package:pharma/core/services/services_locator.dart';
import 'package:pharma/presentation/screens/splash_screen/splash_screen.dart';
import 'package:pharma/translations.dart';
import 'data/data_resource/local_resource/data_store.dart';
import 'presentation/screens/home_screen/home_screen.dart';


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
          providers:[
            BlocProvider(
                create: (BuildContext context) => sl<AuthenticationBloc>()),
            BlocProvider(
              create: (BuildContext context) => sl<LanguageBloc>(),
            ),
          ],
          child: BlocBuilder<LanguageBloc, LanguageState>(
              builder: (context, state)   {
                if (true){
               return   MaterialApp(
                    title: 'Farmy',
                    locale: Locale(DataStore.instance.lang),
                    supportedLocales: AppLocalizations.supportedLocales,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],

                    // home: HomeScreen(),
                    home: const SplashScreen(),
                  );

              }
          }),
        );
      },
    );
  }
}
