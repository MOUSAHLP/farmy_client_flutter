import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/screens/all_invoices/widgets/custom_invoices_row.dart';
import 'package:pharma/translations.dart';

class CustomInvoicesContiner extends StatelessWidget {
  const CustomInvoicesContiner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 15, end: 27),
      child: Container(
        width: 1.sw,
        decoration: BoxDecoration(color: ColorManager.white, boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 4,
            color: ColorManager.black.withOpacity(0.18),
          ),
        ]),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              CustomInvoicesRow(
                label: AppLocalizations.of(context)!.order_Number,
                valueOfLabel: "456123456",
                colorText: ColorManager.primaryGreen,
              ),
              CustomInvoicesRow(
                label: AppLocalizations.of(context)!.order_Date,
                valueOfLabel: "456123456",
              ),
              CustomInvoicesRow(
                label: AppLocalizations.of(context)!.site,
                valueOfLabel: "456123456",
              ),
              CustomInvoicesRow(
                label: AppLocalizations.of(context)!.products_Price,
                valueOfLabel: "456123456",
              ),
              CustomInvoicesRow(
                label: AppLocalizations.of(context)!.price_of_Returned_Products,
                valueOfLabel: "456123456",
              ),
              CustomInvoicesRow(
                label: AppLocalizations.of(context)!.rebates_Value,
                valueOfLabel: "456123456",
              ),
              CustomInvoicesRow(
                label: AppLocalizations.of(context)!.delivery_Price,
                valueOfLabel: "456123456",
              ),
              CustomInvoicesRow(
                label: AppLocalizations.of(context)!.total_price,
                valueOfLabel: "456123456",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
