import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/presentation/screens/order_screen/widgets/baset_not_install.dart';
import 'package:pharma/presentation/screens/order_screen/widgets/shimmer_order.dart';
import 'package:pharma/presentation/screens/order_screen/widgets/card_order.dart';
import 'package:pharma/presentation/widgets/over_scroll_indicator.dart';
import 'package:pharma/translations.dart';
import '../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../../bloc/my_order_bloc/my_order_bloc.dart';
import '../../../bloc/my_order_bloc/my_order_event.dart';
import '../../../bloc/my_order_bloc/my_order_state.dart';
import '../../../core/services/services_locator.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_app.dart';
import '../../resources/style_app.dart';
import '../../widgets/custom_error_screen.dart';
import '../../widgets/custom_no_dataa.dart';
import '../../widgets/dialogs/error_dialog.dart';
import '../../widgets/dialogs/loading_dialog.dart';
import '../base_screen/base_screen.dart';
import '../guest_screen/guest_screen.dart';

class OrderScreen extends StatelessWidget {
   OrderScreen({super.key});
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

class OrderScreenBody extends StatefulWidget {
  const OrderScreenBody({super.key});

  @override
  State<OrderScreenBody> createState() => _OrderScreenBodyState();
}

class _OrderScreenBodyState extends State<OrderScreenBody> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    context.read<MyOrderBloc>().tabController =
        TabController(length: 2, vsync: this, initialIndex: 0);
  }

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
                    if (state.isLoadingDelete) {
                      LoadingDialog().openDialog(context);
                    } else {
                      LoadingDialog().closeDialog(context);
                    }
                    if (state.isErrorDelete) {
                      ErrorDialog.openDialog(context, state.error);
                    }
                    if (state.successDelete) {
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
                            titleError: state.error,
                        ),
                      );
                    } else if (state.screenStates == ScreenStates.success) {
                      return Column(
                            children: [
                              Container(
                                height: 50,
                                width: 1.sw,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    ColorManager.shadowGaryDown,
                                  ],
                                  color: Colors.white,
                                ),
                                child: TabBar(
                                  controller:
                                  context.read<MyOrderBloc>().tabController,
                                  tabs: [
                                    Tab(
                                      child: FittedBox(
                                          child: Text(AppLocalizations.of(context)!.current_requests)),
                                    ),
                                    Tab(
                                      child: FittedBox(
                                          child: Text(AppLocalizations.of(context)!.basket_not_installed)),
                                    ),
                                  ],
                                  unselectedLabelColor: ColorManager.grayForMessage,
                                  labelColor: ColorManager.primaryGreen,
                                  onTap: (v) {
                                    context
                                        .read<MyOrderBloc>()
                                        .add(TapOnPressed(v));
                                  },
                                  labelStyle: getBoldStyle(
                                      color: ColorManager.grayForMessage,
                                      fontSize: 14),
                                  indicatorPadding: const EdgeInsets.only(
                                      bottom: 10.0, left: 30, right: 30),
                                  indicator: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: ColorManager.primaryGreen,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              state.indexTap==0?
                              Expanded(child: BodyOrders(state: state,)):
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 37,vertical: 5),
                                      child: Text(
                                        AppLocalizations.of(context)!.place_orders,
                                        style: getRegularStyle(
                                          color: ColorManager.grayForMessage,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),   Expanded(child: BodyBasketNotInstall(state: state,)),
                                  ],
                                ),
                              )
                            ])
                         ;
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

class BodyOrders extends StatelessWidget {
   BodyOrders({
    super.key
    ,
    required this.state
  });
  MyOrderState state;

  @override
  Widget build(BuildContext context) {
    return CustomOverscrollIndicator(
        child: state.myOrderList.isNotEmpty?RefreshIndicator(
          onRefresh: () async {
            context.read<MyOrderBloc>().add(GetMyOrder());
          },
          child: ListView.builder(
            itemBuilder: (context, index) => CardOrder(
                myOrder: state.myOrderList[index]),
            itemCount: state.myOrderList.length,
          ),
        ) : CustomNoData(
          noDataStatment:
          AppLocalizations.of(context)!.no_order,
        ),
      );
  }
}
class BodyBasketNotInstall extends StatelessWidget {
  BodyBasketNotInstall({
    super.key
    ,
    required this.state
  });
  MyOrderState state;

  @override
  Widget build(BuildContext context) {
    return CustomOverscrollIndicator(
        child: ListView.builder(
          itemBuilder: (context, index) => BasketNotInstallCard(
              myOrder: state.basketModel.basketList[index]),
          itemCount: state.basketModel.basketList.length,
        ),
      );
  }
}
//Basket not installed
