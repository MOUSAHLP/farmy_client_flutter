import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:pharma/bloc/conditions_bloc/conditions_bloc.dart';
import 'package:pharma/bloc/conditions_bloc/conditions_event.dart';
import 'package:pharma/bloc/conditions_bloc/conditions_state.dart';
import 'package:pharma/core/services/services_locator.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/presentation/widgets/custom_error_screen.dart';
import 'package:pharma/presentation/widgets/custom_loading_widget.dart';

class ConditionsScreen extends StatelessWidget {
  const ConditionsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConditionsBloc>(
      lazy: true,
      create: (BuildContext context) =>
          sl<ConditionsBloc>()..add(GetConditions()),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(PaddingApp.p20),
          child: BlocConsumer<ConditionsBloc, ConditionsState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is ConditionsError) {
                  return CustomErrorScreen(
                    onTap: () {
                      context.read<ConditionsBloc>().add(GetConditions());
                    },
                  );
                }
                if (state is ConditionsSuccess) {
                  String html = context
                      .read<ConditionsBloc>()
                      .conditionModel!
                      .data!
                      .html!;
                  return Center(
                    child: HtmlWidget(html),
                  );
                }
                return const CustomLoadingWidget();
              }),
        ),
      ),
    );
  }
}
