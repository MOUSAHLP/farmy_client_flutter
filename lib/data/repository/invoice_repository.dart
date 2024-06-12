import 'package:dartz/dartz.dart';
import 'package:pharma/data/data_resource/local_resource/data_store.dart';
import '../../core/utils/api_const.dart';
import '../../models/invoice_model.dart';
import '../data_resource/remote_resource/api_handler/base_api_client.dart';
class InvoiceRepository {
  static Future<Either<String, List<InvoiceModel>>> getInvoice() {
    return BaseApiClient.get<List<InvoiceModel>>(
        url: ApiConst.getInvoices,
        queryParameters: {
          'lang': DataStore.instance.lang,
        },
        converter: (e) {
          return InvoiceModel.listFromJson(e["data"]);
        });
  }


}
