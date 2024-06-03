import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/authentication_bloc/authentication_event.dart';
import 'package:pharma/bloc/authentication_bloc/authertication_bloc.dart';
import 'package:pharma/bloc/setting_bloc/setting_bloc.dart';
import 'package:pharma/bloc/setting_bloc/setting_state.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // context.read<AuthenticationBloc>().add(ChangeLang());
    return BlocConsumer<SettingBloc, SettingState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          width: 1.sw,
          height: 1.sh,
          color: ColorManager.primaryGreen,
          child: Image.asset(LottieManager.logoSplash),
        );
      },
    );
  }
}
