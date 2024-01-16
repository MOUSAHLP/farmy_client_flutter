import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/presentation/screens/order_screen/widgets/shimmer_order.dart';
import 'package:pharma/presentation/screens/order_screen/widgets/card_order.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/over_scroll_indicator.dart';
import 'package:pharma/translations.dart';
import '../../../bloc/my_order_bloc/my_order_bloc.dart';
import '../../../bloc/my_order_bloc/my_order_event.dart';
import '../../../bloc/my_order_bloc/my_order_state.dart';
import '../../../core/services/services_locator.dart';
import '../../widgets/custom_error_screen.dart';
import '../../widgets/custom_no_dataa.dart';
class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => sl<MyOrderBloc>()..add(GetMyOrder()),
    child:const OrderScreenBody() ,);
  }
}


class OrderScreenBody extends StatelessWidget {
  const OrderScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          CustomAppBarScreen(sectionName: AppLocalizations.of(context)!.my_order,isComeBack: false),
          Expanded (child: BlocBuilder<MyOrderBloc, MyOrderState>(

              builder: (context, state) {
                if (state is MyOrderLoading) {
                  return const BuildShimmerOrders();
                }
                else if (state is MyOrderError) {
                  return Center(
                    child: CustomErrorScreen(
                      onTap: () {
                        context.read<MyOrderBloc>().add(GetMyOrder());
                      },
                    ),
                  );
                } else if (state is MyOrderSuccess) {
                  return state.myOrderList.isNotEmpty
                      ?  CustomOverscrollIndicator(
                      child: ListView.builder(
                        itemBuilder: (context, index) => CardOrder(myOrder:state.myOrderList[index]) ,
                      itemCount:state.myOrderList.length,),
                   ) :  CustomNoData(noDataStatment: AppLocalizations.of(context)!.no_order,);
                } else {
                  return const Text("");
                }
              }))

          // )
        ]),
      ),
    );
  }
}
