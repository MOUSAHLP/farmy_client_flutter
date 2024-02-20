import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:pharma/bloc/privacy_bloc/privacy_bloc.dart';
import 'package:pharma/bloc/privacy_bloc/privacy_event.dart';
import 'package:pharma/bloc/privacy_bloc/privacy_state.dart';
import 'package:pharma/core/services/services_locator.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/presentation/widgets/custom_error_screen.dart';
import 'package:pharma/presentation/widgets/custom_loading_widget.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PrivacyBloc>(
      lazy: true,
      create: (BuildContext context) => sl<PrivacyBloc>()..add(GetPrivacy()),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(PaddingApp.p20),
          child: BlocConsumer<PrivacyBloc, PrivacyState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is PrivacyError) {
                  return CustomErrorScreen(
                    onTap: () {
                      context.read<PrivacyBloc>().add(GetPrivacy());
                    },
                  );
                }
                if (state is PrivacySuccess) {
                  String html =
                      context.read<PrivacyBloc>().privacyModel!.data!.html!;
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
