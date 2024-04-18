import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/invoices_bloc/invoices_bloc.dart';
import 'package:pharma/bloc/invoices_bloc/invoices_event.dart';
import 'package:pharma/presentation/screens/all_invoices/widgets/custom_invoices_continer.dart';
import 'package:pharma/presentation/screens/guest_screen/guest_screen.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/translations.dart';

import '../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../../bloc/invoices_bloc/invoices_state.dart';
import '../../../core/services/services_locator.dart';
import '../../widgets/custom_error_screen.dart';
import '../../widgets/custom_loading_widget.dart';

class AllInvoicesScreen extends StatelessWidget {
  const AllInvoicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InvoicesBloc>(
      create: (context) {
        if (sl<AuthenticationBloc>().loggedIn) {
          return sl<InvoicesBloc>()..add(GetInvoicesList());
        }
        return sl<InvoicesBloc>();
      },
      child: const AllInvoicesBody(),
    );
  }
}

class AllInvoicesBody extends StatelessWidget {
  const AllInvoicesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBarScreen(
              sectionName: AppLocalizations.of(context)!.all_Invoices,
            ),
            sl<AuthenticationBloc>().loggedIn
                ? Expanded(
                    child: BlocBuilder<InvoicesBloc, InvoicesState>(
                      builder: (context, state) {
                        if (state is InvoicesLoading) {
                          return const Center(child: CustomLoadingWidget());
                        }
                        if (state is InvoicesError) {
                          return Center(
                            child: CustomErrorScreen(
                              onTap: () {
                                context
                                    .read<InvoicesBloc>()
                                    .add(GetInvoicesList());
                              },
                            ),
                          );
                        }
                        if (state is InvoicesSuccess) {
                          return ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 29),
                            itemCount: state.vendorsList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: CustomInvoicesContainer(
                                  invoiceModel: state.vendorsList[index],
                                ),
                              );
                            },
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  )
                : const GuestScreen()
          ],
        ),
      ),
    );
  }
}
