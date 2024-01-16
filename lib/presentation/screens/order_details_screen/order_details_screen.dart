import 'package:flutter/material.dart';
import 'package:pharma/presentation/screens/order_details_screen/widgets/card_details_order.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/over_scroll_indicator.dart';

import '../../../models/order_details_model.dart';
import '../../../translations.dart';

class OrderDetailsScreen extends StatelessWidget {

  final List<OrderDetailsModel> orderDetailsList;
  const OrderDetailsScreen({super.key, required this.orderDetailsList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBarScreen(
                sectionName: AppLocalizations.of(context)!.order_details),
            Expanded(
              child: CustomOverscrollIndicator(
                child: ListView.builder(
                  itemBuilder: (context, index) => CardDetailsOrder(
                      productAddedToBasketDetails:
                      orderDetailsList[index]),
                  itemCount: orderDetailsList.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
