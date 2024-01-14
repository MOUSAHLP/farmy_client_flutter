import 'package:flutter/material.dart';
import 'package:pharma/presentation/screens/all_invoices/widgets/custom_invoices_continer.dart';
import 'package:pharma/presentation/screens/guest_screen/guest_screen.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/translations.dart';

import '../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../../core/services/services_locator.dart';

class AllInvoicesScreen extends StatelessWidget {
  const AllInvoicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBarScreen(
                sectionName: AppLocalizations.of(context)!.all_Invoices),
            Expanded(
              child: sl<AuthenticationBloc>().loggedIn? ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 29),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: CustomInvoicesContiner(),
                  );
                },
              ):const GuestScreen(),
            )
          ],
        ),
      ),
    );
  }
}
