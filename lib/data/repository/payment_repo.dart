import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pharma/core/utils/api_const.dart';
import 'package:pharma/data/data_resource/remote_resource/api_handler/base_api_client.dart';
import 'package:pharma/models/delevery_attributes_response.dart';
import 'package:pharma/models/params/Invoices_params.dart';
import 'package:pharma/models/params/payment_process_parms.dart';
import 'package:pharma/models/product_details_response.dart';

import '../../models/payment_process_response.dart';

class PaymentRepo {
  Future<Either<String, PaymentProcessResponse>> getInvoiceDetails(
      PaymentProcessParms paymentProcessParms, InvoicesParms invoicesParms) {
    return BaseApiClient.post<PaymentProcessResponse>(
        formData: paymentProcessParms.toJsonWithParms(invoicesParms),
        url: ApiConst.getPaymentDetails,
        converter: (e) {
          return PaymentProcessResponse.fromJson(e["data"]);
        });
  }

  Future<Either<String, String>> createOrder(
    PaymentProcessParms paymentProcessParms,
    InvoicesParms invoicesParms,
    List<DeliveryAttributesResponse>? deleveryAttributesList,
  ) {
    return BaseApiClient.post<String>(
        formData: paymentProcessParms.createOrdertoJsonWithParms(invoicesParms,
            deleveryAttributesList, paymentProcessParms.prodictInBasketList),
        url: ApiConst.createOrders,
        converter: (e) {
          return e["message"];
        });
  }
}
