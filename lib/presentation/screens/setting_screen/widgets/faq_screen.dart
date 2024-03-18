import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:pharma/bloc/faq_bloc/faq_bloc.dart';
import 'package:pharma/bloc/faq_bloc/faq_event.dart';
import 'package:pharma/bloc/faq_bloc/faq_state.dart';
import 'package:pharma/core/services/services_locator.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/presentation/widgets/custom_error_screen.dart';
import 'package:pharma/presentation/widgets/custom_loading_widget.dart';

import '../../../../translations.dart';
import '../../../widgets/custom_app_bar_screen.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FaqBloc>(
      lazy: true,
      create: (BuildContext context) => sl<FaqBloc>()..add(GetFAQ()),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              CustomAppBarScreen(
                sectionName: AppLocalizations.of(context)!.frequently_Asked_Questions,
                isComeBack: true,
              ),
              Padding(
                padding: const EdgeInsets.all(PaddingApp.p20),
                child: BlocConsumer<FaqBloc, FAQState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is FAQError) {
                        return CustomErrorScreen(
                          onTap: () {
                            context.read<FaqBloc>().add(GetFAQ());
                          },
                        );
                      }
                      if (state is FAQSuccess) {
                        String html = context.read<FaqBloc>().faqModel!.data!.html!;
                        return Center(
                          child: HtmlWidget(html),
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
