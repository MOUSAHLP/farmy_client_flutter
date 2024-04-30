import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/all_invoices/widgets/custom_invoices_row.dart';
import 'package:pharma/translations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/formatter.dart';
import '../../../../models/invoice_model.dart';
import '../../../../models/user_address_response.dart';
import '../../../widgets/custom_button.dart';

class CustomInvoicesContainer extends StatelessWidget {
  const CustomInvoicesContainer({super.key, required this.invoiceModel});

  final InvoiceModel invoiceModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: 15.w,
        end: 27.w,
      ),
      child: Container(
        width: 1.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            7.0.r,
          ),
          color: ColorManager.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              blurRadius: 10,
              spreadRadius: -3,
              color: ColorManager.black.withOpacity(0.18),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              CustomInvoicesRow(
                textStyle:getBoldStyle(
                  color: ColorManager.primaryGreen,
                  fontSize: FontSizeApp.s13.sp,
                ),
                label: "${AppLocalizations.of(context)!.order_Number} :",
                valueOfLabel: invoiceModel.orderNumber.toString(),
                colorText: ColorManager.primaryGreen,
              ),
              CustomInvoicesRow(
                label: AppLocalizations.of(context)!.order_Date,
                valueOfLabel: Formatter.formatDateOnlyNumbers(context, invoiceModel.date) ?? "",
              ),
              CustomInvoicesRow(
                label: AppLocalizations.of(context)!.site,
                valueOfLabel: getAddress(invoiceModel.userAddress!),
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
              SizedBox(height: 10,),
              CustomButton(
                width: 1.sw-200,
                label: AppLocalizations.of(context)!.download_pdf,
                fillColor: ColorManager.primaryGreen,
                isFilled: true,
                borderColor:
                ColorManager.primaryGreen,
                labelColor:
                Colors.white,
                onTap: () {
                  launchUrl(
                    Uri.parse(
                        invoiceModel.pdfUrl??"" ),
                    mode: LaunchMode
                        .externalApplication,
                  );

                },
              )
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
    final areaPart = area != null ? "$area  " : "";
    final streetPart = street != null ? "$street - " : "";
    final buildingPart = building != null ? "$building - " : "";
    final floorPart = floor != null ? "$floor " : "";

    return "$areaPart".trimRight();
  }
}
