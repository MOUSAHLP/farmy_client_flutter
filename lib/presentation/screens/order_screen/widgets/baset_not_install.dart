import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/bloc/my_order_bloc/my_order_bloc.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/screens/order_screen/widgets/row_order.dart';
import 'package:pharma/translations.dart';
import '../../../../bloc/my_order_bloc/my_order_event.dart';
import '../../../../models/params/get_basket_params.dart';
import '../../../widgets/custom_button.dart';
import '../../order_not_install_details_screen/order_not_install_details_screen.dart';

class BasketNotInstallCard extends StatelessWidget {
  const BasketNotInstallCard({super.key, required this.myOrder});

  final GetBasketParams myOrder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 37),
      child: Stack(
        children: [
          Container(
            width: 1.sw,
            decoration: BoxDecoration(
                boxShadow: [ColorManager.shadowGaryRightDown],
                color: Colors.white,
                borderRadius: BorderRadius.circular(6)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        RowOrder(
                            title:
                                AppLocalizations.of(context)!.type_of_request,
                            details: "سلة غير مثبتة"),
                        const SizedBox(
                          height: 5,
                        ),
                        RowOrder(
                            title:
                                AppLocalizations.of(context)!.number_of_orders,
                            details: myOrder.products.length.toString()),
                        const SizedBox(
                          height: 5,
                        ),
                        RowOrder(
                            title:"رقم السلة",
                            details: myOrder.id.toString()),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            height: 38,
                            radius: 6,
                            label: AppLocalizations.of(context)!.edit_Orders,
                            fillColor: ColorManager.yellow,
                            labelColor: Colors.white,
                            onTap: () {
                              AppRouter.push(
                                context,
                                OrderNotInstallDetailsScreen(
                                  id: myOrder.products,
                                  isEdit: true,
                                  idBasket: myOrder.id,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 3),
                        Expanded(
                          child: CustomButton(
                            height: 38,
                            radius: 6,
                            label: AppLocalizations.of(context)!.delete_Order,
                            fillColor: Colors.white,
                            labelColor: ColorManager.primaryGreen,
                            borderColor: ColorManager.primaryGreen,
                            isFilled: true,
                            onTap: () {
                              context.read<MyOrderBloc>().add(
                                    DeleteBasket(
                                      idBasket: myOrder.id,
                                    ),
                                  );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          PositionedDirectional(
              top: 20,
              end: 20,
              child: SvgPicture.asset(IconsManager.basketNotInstall))
        ],
      ),
    );
  }
}
