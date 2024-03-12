import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/my_order_bloc/my_order_bloc.dart';
import '../../../../bloc/my_order_bloc/my_order_event.dart';
import '../../../../core/app_router/app_router.dart';
import '../../../../translations.dart';
import '../../../resources/color_manager.dart';
import '../../../widgets/custom_button.dart';
import '../../order_details_screen/order_details_screen.dart';
class StateButtons extends StatelessWidget {
   const StateButtons({Key? key, required this.status,required this.id}) : super(key: key);
  final String status;
final int id;
  @override
  Widget build(BuildContext context) {
    Widget getButtonsBasedOnStatus(String status) {
      List<Widget> buttons;
      switch (status) {
        case "Pending":
          buttons = [
            Expanded(
              child: CustomButton(
                label:AppLocalizations.of(context)!.show_Order,
                fillColor: ColorManager.yellow,
                labelColor: Colors.white,
                onTap: () {
                  return AppRouter.push(context, OrderDetailsScreen(id:id,));
                },
              ),
            ),
            const SizedBox(width: 2),
            Expanded(
              child: CustomButton(
                label:AppLocalizations.of(context)!.edit_Orders,
                fillColor: ColorManager.yellow,
                labelColor: Colors.white,
                onTap: () {
                  return AppRouter.push(context, OrderDetailsScreen(id:id,isEdit: true,));

                },
              ),
            ),
            const SizedBox(width: 2),
            Expanded(
              child: CustomButton(
                label: AppLocalizations.of(context)!.delete_Order,
                fillColor: ColorManager.yellow,
                labelColor: Colors.white,
                onTap: () {
                  context.read<MyOrderBloc>().add(DeleteOrder(id: id));
                  //DeleteOrder
                },
              ),
            ),
          ];
          break;
        case "Confirmed":
          buttons = [
            Expanded(
              child: CustomButton(
                label: AppLocalizations.of(context)!.show_Order,
                fillColor: ColorManager.yellow,
                labelColor: Colors.white,
                onTap: () {},
              ),
            ),

          ];
          break;
        case "OnDelivery":
          buttons = [
            Expanded(
              child: CustomButton(
                label:AppLocalizations.of(context)!.show_Order,
                fillColor: ColorManager.yellow,
                labelColor: Colors.white,
                onTap: () {},
              ),
            ),
            const SizedBox(width: 2),
            Expanded(
              child: CustomButton(
                label: AppLocalizations.of(context)!.returned,
                fillColor: ColorManager.yellow,
                labelColor: Colors.white,
                onTap: () {},
              ),
            ),
            const SizedBox(width: 2),
            Expanded(
              child: CustomButton(
                label:AppLocalizations.of(context)!.track_Order,
                fillColor: ColorManager.yellow,
                labelColor: Colors.white,
                onTap: () {},
              ),
            ),
          ];
          break;
        case "Deliverd":
          buttons = [
            Expanded(
              child: CustomButton(
                label:AppLocalizations.of(context)!.show_Order,
                fillColor: ColorManager.yellow,
                labelColor: Colors.white,
                onTap: () {},
              ),
            ),
          ];
          break;
        case "Cancelled":
          buttons = [
            Expanded(
              child: CustomButton(
                label: AppLocalizations.of(context)!.show_Order,
                fillColor: ColorManager.yellow,
                labelColor: Colors.white,
                onTap: () {},
              ),
            ),
          ];
          break;
        case "Returned":
          buttons = [
            Expanded(
              child: CustomButton(
                label: AppLocalizations.of(context)!.show_Order,
                fillColor: ColorManager.yellow,
                labelColor: Colors.white,
                onTap: () {},
              ),
            ),
          ];
          break;
        default:
          return const Text("");
      }

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: buttons,
      );
    }
    return getButtonsBasedOnStatus(status);

  }
}

