// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pharma/presentation/resources/color_manager.dart';
// import 'package:pharma/presentation/resources/style_app.dart';
//
// import '../../../../models/order_details_model.dart';
// import '../../../../translations.dart';
// import '../../../widgets/over_scroll_indicator.dart';
// import '../../base_screen/base_screen.dart';
// import '../../order_details_screen/widgets/card_details_order.dart';
//
// class ReturnOrderScreen extends StatelessWidget {
//   final List<OrderDetailsModel> orderDetailsList;
//
//   const ReturnOrderScreen({super.key, required this.orderDetailsList});
//
//   @override
//   Widget build(BuildContext context) {
//     return BaseScreenScaffold(
//       appbarTitle: AppLocalizations.of(context)!.cart,
//       isComeBack: false,
//       body: Column(
//         children: [
//           // const CustomAppBar(),
//           // CustomAppBarScreen(sectionName: AppLocalizations.of(context)!.cart),
//           IntrinsicWidth(
//             child: Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(15.w, 5.h, 10.w, 0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       AppLocalizations.of(context)!.delete_your_order,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: getSemiBoldStyle(
//                           color: ColorManager.grayForMessage, fontSize: 15.sp),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: CustomOverscrollIndicator(
//               child: ListView.builder(
//                 padding: EdgeInsets.zero,
//                 itemBuilder: (context, index) => CardDetailsOrder(
//                   productAddedToBasketDetails: orderDetailsList[index],
//                   // cardColor: ColorManager.lightRed,
//                   onTapDelete: () {},
//                 ),
//                 itemCount: orderDetailsList.length,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
