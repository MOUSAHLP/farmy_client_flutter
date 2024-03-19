import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:pharma/bloc/who_we_are_bloc/who_we_are_bloc.dart';
import 'package:pharma/bloc/who_we_are_bloc/who_we_are_event.dart';
import 'package:pharma/bloc/who_we_are_bloc/who_we_are_state.dart';
import 'package:pharma/core/services/services_locator.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_error_screen.dart';
import 'package:pharma/presentation/widgets/custom_loading_widget.dart';
import 'package:pharma/translations.dart';

class WhoWeAreScreen extends StatelessWidget {
  const WhoWeAreScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<WhoWeAreBloc>(
        lazy: true,
        create: (BuildContext context) => sl<WhoWeAreBloc>()..add(GetWhoWeAre()),
        child: Scaffold(
          backgroundColor: ColorManager.white,
          body: Column(
            children: [
              CustomAppBarScreen(
                sectionName: AppLocalizations.of(context)!.who_are_we,
                isComeBack: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: PaddingApp.p40),
                child: BlocConsumer<WhoWeAreBloc, WhoWeAreState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is WhoWeAreError) {
                        return CustomErrorScreen(
                          onTap: () {
                            context.read<WhoWeAreBloc>().add(GetWhoWeAre());
                          },
                        );
                      }
                      if (state is WhoWeAreSuccess) {
                        String html = context.read<WhoWeAreBloc>().whoWeAreModel!.data!.html!;
                        return Center(
                          child: Column(
                            children: [
                              HtmlWidget(html),
                            ],
                          ),
                        );
                      }
                      return const CustomLoadingWidget();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
