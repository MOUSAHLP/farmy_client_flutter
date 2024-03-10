import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/basket_bloc/basket_bloc.dart';
import '../../../core/app_router/app_router.dart';
import '../../../models/product_details_response.dart';
import '../../../translations.dart';
import '../../resources/color_manager.dart';
import '../../resources/style_app.dart';
import '../custom_button.dart';

class ConfirmDeleteProductDialog extends StatelessWidget {
  const ConfirmDeleteProductDialog(
      {required this.productAddedToBasketDetails, super.key});

  final ProductResponse productAddedToBasketDetails;

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
                      AppLocalizations.of(context)!.delete_product,
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
                        context.read<BasketBloc>().add(
                            DeleteProduct(productAddedToBasketDetails.id ?? 0));
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
