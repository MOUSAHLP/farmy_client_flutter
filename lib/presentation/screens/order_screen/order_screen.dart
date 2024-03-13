import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/presentation/screens/order_screen/widgets/shimmer_order.dart';
import 'package:pharma/presentation/screens/order_screen/widgets/card_order.dart';
import 'package:pharma/presentation/widgets/over_scroll_indicator.dart';
import 'package:pharma/translations.dart';
import '../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../../bloc/my_order_bloc/my_order_bloc.dart';
import '../../../bloc/my_order_bloc/my_order_event.dart';
import '../../../bloc/my_order_bloc/my_order_state.dart';
import '../../../core/services/services_locator.dart';
import '../../widgets/custom_error_screen.dart';
import '../../widgets/custom_no_dataa.dart';
import '../../widgets/dialogs/error_dialog.dart';
import '../../widgets/dialogs/loading_dialog.dart';
import '../base_screen/base_screen.dart';
import '../guest_screen/guest_screen.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        if (sl<AuthenticationBloc>().loggedIn) {
          return sl<MyOrderBloc>()..add(GetMyOrder());
        }
        return sl<MyOrderBloc>();
      },
      child: const OrderScreenBody(),
    );
  }
}

class OrderScreenBody extends StatelessWidget {
  const OrderScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreenScaffold(
      backgroundColor: Colors.white,
      appbarTitle: AppLocalizations.of(context)!.my_order,
      isComeBack: false,
      body: Column(
        children: [
          Expanded(
            child: sl<AuthenticationBloc>().loggedIn
                ? BlocConsumer<MyOrderBloc, MyOrderState>(
                    listener: (context, state) {
                    if (state.isLoadingDelet) {
                      LoadingDialog().openDialog(context);
                    } else {
                      LoadingDialog().closeDialog(context);
                    }
                    if (state.isErrorDelet) {
                      ErrorDialog.openDialog(context, state.error);
                    }
                    if (state.successDelet) {
                      context.read<MyOrderBloc>().add(GetMyOrder());
                    }
                  },

                builder: (context, state) {
                    if (state.screenStates == ScreenStates.loading) {
                      return const BuildShimmerOrders();
                    } else if (state.screenStates == ScreenStates.error) {
                      return Center(
                        child: CustomErrorScreen(
                          onTap: () {
                            context.read<MyOrderBloc>().add(GetMyOrder());
                          },
                        ),
                      );
                    } else if (state.screenStates == ScreenStates.success) {
                      return state.myOrderList.isNotEmpty
                          ? CustomOverscrollIndicator(
                              child: ListView.builder(
                                itemBuilder: (context, index) => CardOrder(
                                    myOrder: state.myOrderList[index]),
                                itemCount: state.myOrderList.length,
                              ),
                            )
                          : CustomNoData(
                              noDataStatment:
                                  AppLocalizations.of(context)!.no_order,
                            );
                    } else {
                      return const Text("");
                    }
                  })
                : const GuestScreen(),
          ),
        ],
      ),
    );
  }
}
