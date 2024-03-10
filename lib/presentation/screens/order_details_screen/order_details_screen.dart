import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/details_order_bloc/details_order_event.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/custom_app_bar.dart';
import 'package:pharma/presentation/screens/order_details_screen/widgets/card_details_order.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_error_screen.dart';
import 'package:pharma/presentation/widgets/over_scroll_indicator.dart';
import '../../../bloc/details_order_bloc/details_order_bloc.dart';
import '../../../bloc/details_order_bloc/details_order_state.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/formatter.dart';
import '../../../translations.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_app.dart';
import '../../resources/style_app.dart';
import '../../widgets/custom_button.dart';

class OrderDetailsScreen extends StatelessWidget {
 final int id;
  const OrderDetailsScreen({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return sl<DetailsOrderBloc>()
          ..add(GetDetailsOrder(id:id));
      },
      child:  OrderDetailsBody(id: id),
    );
  }
}

class OrderDetailsBody extends StatelessWidget {
final int id;
  const OrderDetailsBody({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            CustomAppBarScreen(
                sectionName: AppLocalizations.of(context)!.order_details),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 21),
              child: Text(
                AppLocalizations.of(context)!
                    .payment_statment,
                style: getRegularStyle(
                  color: ColorManager.grayForMessage,
                  fontSize: FontSizeApp.s16,
                ),
              ),
            ),
            BlocConsumer<DetailsOrderBloc, DetailsOrderState>(
              listener: (context, state) {
                // TODO: implement listener}
              },
              builder:(context, state)
              {
                if(state.screenStates==ScreenStates.loading) {
                  return CircularProgressIndicator();
                } else if(state.screenStates==ScreenStates.error) {
                  return CustomErrorScreen(onTap: () {
                    sl<DetailsOrderBloc>().add(GetDetailsOrder(id:id));
                  },
                    titleError: state.error,);
                }
               return Expanded(
                 child: Column(
                   children: [
                     Expanded(
                        child: CustomOverscrollIndicator(
                          child: ListView.builder(
                            itemBuilder: (context, index) => CardDetailsOrder(
                                productAddedToBasketDetails: state.productList[index]),
                            itemCount:  state.productList.length,
                          ),
                        ),
                      ),
                     state.productList.isEmpty
                         ? const SizedBox()
                         : Container(
                       width: 1.sw,
                       decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: const BorderRadius.only(
                               topLeft: Radius.circular(22),
                               topRight: Radius.circular(22)),
                           boxShadow: [ColorManager.shadowGaryUp]),
                       child: Column(
                         mainAxisSize: MainAxisSize.min,
                         children: [
                           const SizedBox(
                             height: 9,
                           ),
                           Text(
                               AppLocalizations.of(context)!
                                   .totalPrice,
                               style: getBoldStyle(
                                   color:
                                   ColorManager.grayForMessage,
                                   fontSize: 14)),
                           Row(
                             mainAxisAlignment:
                             MainAxisAlignment.center,
                             children: [
                               Text(
                                  "666",
                                   style: getBoldStyle(
                                       color:
                                       ColorManager.primaryGreen,
                                       fontSize: 24)),
                               const SizedBox(
                                 width: 2,
                               ),
                               Text(
                                   AppLocalizations.of(context)!
                                       .curruncy,
                                   style: getBoldStyle(
                                       color: ColorManager
                                           .primaryGreen,
                                       fontSize: 15)!
                                       .copyWith(height: 1))
                             ],
                           ),
                           Padding(
                             padding: const EdgeInsets.symmetric(
                                 horizontal: 27, vertical: 9),
                             child: Row(
                               children: [
                                 Expanded(
                                   child: CustomButton(
                                     label: AppLocalizations.of(
                                         context)!
                                         .proceed_to_checkout,
                                     fillColor:
                                     ColorManager.primaryGreen,
                                     onTap: () {

                                     },
                                   ),
                                 ),
                                 const SizedBox(
                                   width: 16,
                                 ),
                                 Expanded(
                                   child: CustomButton(
                                     label:"رجوع",
                                     fillColor:
                                     ColorManager.primaryGreen,
                                     labelColor: Colors.white,
                                     onTap: () {


                                            // SystemNavigator.pop();
                                     },
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           const SizedBox(
                             height: 9,
                           ),
                         ],
                       ),
                     )
                   ],
                 ),
               );
              },
            )
          ],
        ),
      ),
    );
  }
}
