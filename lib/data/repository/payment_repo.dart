import 'package:dartz/dartz.dart';
import 'package:pharma/core/utils/api_const.dart';
import 'package:pharma/data/data_resource/remote_resource/api_handler/base_api_client.dart';
import 'package:pharma/models/delivery_attributes_response.dart';
import 'package:pharma/models/delivery_changes_response.dart';
import 'package:pharma/models/params/Invoices_params.dart';
import 'package:pharma/models/params/payment_process_parms.dart';

import '../../models/payment_process_response.dart';

class PaymentRepo {
  Future<Either<String, PaymentProcessResponse>> getInvoiceDetails(
      PaymentProcessParams paymentProcessParms, InvoicesParams invoicesParams) {
    return BaseApiClient.post<PaymentProcessResponse>(
        formData: paymentProcessParms.toJsonWithParams(invoicesParams),
        url: ApiConst.getPaymentDetails,
        converter: (e) {
          return PaymentProcessResponse.fromJson(e["data"]);
        });
  }

  Future<Either<String, String>> createOrder(
    PaymentProcessParams paymentProcessParams,
    InvoicesParams invoicesParams,
    List<DeliveryAttributesResponse>? deliveryAttributesList,
    List<int?>? deliveryChangesList,
  ) {
    return BaseApiClient.post<String>(
        formData: paymentProcessParams.createOrderToJsonWithParams(invoicesParams, deliveryAttributesList, paymentProcessParams.productInBasketList,deliveryChangesList),
        url: ApiConst.createOrders,
        converter: (e) {
          return e["message"];
        });
  }
}
