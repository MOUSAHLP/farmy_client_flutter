import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/screens/all_invoices/widgets/custom_invoices_row.dart';
import 'package:pharma/translations.dart';

import '../../../../core/utils/formatter.dart';
import '../../../../models/invoice_model.dart';
import '../../../../models/user_address_response.dart';

class CustomInvoicesContainer extends StatelessWidget {
  const CustomInvoicesContainer({super.key ,required this.invoiceModel});
 final InvoiceModel invoiceModel;
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
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              CustomInvoicesRow(
                label: AppLocalizations.of(context)!.order_Number,
                valueOfLabel: invoiceModel.orderNumber.toString(),
                colorText: ColorManager.primaryGreen,
              ),
              CustomInvoicesRow(
                label: AppLocalizations.of(context)!.order_Date,
                valueOfLabel: Formatter.formatDateOnly(context, invoiceModel.date)??"" ,
              ),
              CustomInvoicesRow(
                label: AppLocalizations.of(context)!.site,

                valueOfLabel: getAddress(invoiceModel.userAddress!),
              ),
              CustomInvoicesRow(
                label: AppLocalizations.of(context)!.products_Price,
                valueOfLabel: "test qmar",
              ),
              CustomInvoicesRow(
                label: AppLocalizations.of(context)!.price_of_Returned_Products,
                valueOfLabel: "test qmar",
              ),
              CustomInvoicesRow(
                label: AppLocalizations.of(context)!.rebates_Value,
                valueOfLabel: invoiceModel.couponDiscount.toString(),
              ),
              CustomInvoicesRow(
                label: AppLocalizations.of(context)!.delivery_Price,
                valueOfLabel: invoiceModel.deliveryFee.toString(),
              ),
              CustomInvoicesRow(
                label: AppLocalizations.of(context)!.total_price,
                valueOfLabel: invoiceModel.total.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
  String getAddress(UserAddressModel userAddressModel) {
    final name = userAddressModel.name;
    final area = userAddressModel.area;
    final street = userAddressModel.street;
    final building = userAddressModel.building;
    final floor = userAddressModel.floor;

    final namePart = name != null ? "$name - " : "";
    final areaPart = area != null ? "$area - " : "";
    final streetPart = street != null ? "$street - " : "";
    final buildingPart = building != null ? "$building - " : "";
    final floorPart = floor != null ? "$floor " : "";

    return "$namePart$areaPart$streetPart$buildingPart$floorPart".trimRight();
  }
}
