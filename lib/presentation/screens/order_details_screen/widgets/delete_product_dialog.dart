import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/presentation/resources/style_app.dart';

import '../../../../bloc/details_order_bloc/details_order_bloc.dart';
import '../../../../bloc/details_order_bloc/details_order_event.dart';
import '../../../../core/app_router/app_router.dart';
import '../../../../models/product_response.dart';
import '../../../../translations.dart';

import '../../../resources/color_manager.dart';

import '../../../widgets/custom_button.dart';


class DeleteProductDialog extends StatelessWidget {
  const DeleteProductDialog(
      {required this.product, super.key});

  final ProductResponse product;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IntrinsicWidth(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "حذف المنتج",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: getBoldStyle(
                          color: ColorManager.grayForMessage, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      label: AppLocalizations.of(context)!.confirm,
                      fillColor: ColorManager.primaryGreen,
                      onTap: () {
                        context.read<DetailsOrderBloc>().add(
                            DeleteProduct(product.id ?? 0));
                        AppRouter.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 28,
                  ),
                  Expanded(
                    child: CustomButton(
                      label: AppLocalizations.of(context)!.back,
                      fillColor: Colors.white,
                      onTap: () {
                        AppRouter.pop(context);
                      },
                      isFilled: true,
                      labelColor: ColorManager.primaryGreen,
                      borderColor: ColorManager.primaryGreen,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
