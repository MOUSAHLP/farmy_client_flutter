import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/presentation/screens/order_screen/widgets/shimmer_order.dart';
import 'package:pharma/presentation/screens/order_screen/widgets/card_order.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/over_scroll_indicator.dart';
import 'package:pharma/translations.dart';
import '../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../../bloc/my_order_bloc/my_order_bloc.dart';
import '../../../bloc/my_order_bloc/my_order_event.dart';
import '../../../bloc/my_order_bloc/my_order_state.dart';
import '../../../core/services/services_locator.dart';
import '../../widgets/custom_no_dataa.dart';
import '../guest_screen/guest_screen.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBarScreen(
              sectionName: AppLocalizations.of(context)!.order_archive,
              isComeBack: true,
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: sl<AuthenticationBloc>().loggedIn
                  ? BlocBuilder<MyOrderBloc, MyOrderState>(
                      builder: (context, state) {
                        if (state.screenStates == ScreenStates.loading) {
                          return const BuildShimmerOrders();
                        } else if (state.screenStates == ScreenStates.success) {
                          return Column(
                            children: [
                              Expanded(
                                child: BodyOrders(
                                  state: state,
                                ),
                              )
                            ],
                          );
                        } else {
                          return const Text("");
                        }
                      },
                    )
                  : const GuestScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

class BodyOrders extends StatelessWidget {
  const BodyOrders({super.key, required this.state});

  final MyOrderState state;

  @override
  Widget build(BuildContext context) {
    return CustomOverscrollIndicator(
      child: state.myOrderHistoryList.isNotEmpty
          ? RefreshIndicator(
              onRefresh: () async {
                context.read<MyOrderBloc>().add(GetOrderHistory());
              },
              child: ListView.builder(
                itemBuilder: (context, index) => CardOrder(
                  myOrder: state.myOrderHistoryList[index],
                ),
                itemCount: state.myOrderHistoryList.length,
              ),
            )
          : CustomNoData(
              noDataStatment: AppLocalizations.of(context)!.no_order,
            ),
    );
  }
}
