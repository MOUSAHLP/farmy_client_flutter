import 'package:dartz/dartz.dart';
import '../../core/utils/api_const.dart';
import '../../models/my_order_response.dart';
import '../../models/order_details_model.dart';
import '../data_resource/remote_resource/api_handler/base_api_client.dart';

class MyOrderRepository {
  static Future<Either<String, List<MyOrderResponse>>> getMyOrder() {
    return BaseApiClient.get<List<MyOrderResponse>>(
      url: ApiConst.getMyOrder,
      converter: (e) {
        return MyOrderResponse.listFromJson(e["data"]);
      },
    );
  }
  static Future<Either<String, List<OrderDetailsModel>>> getDetailsOrder(int id) {
    return BaseApiClient.get<List<OrderDetailsModel>>(
      url: ApiConst.getDetailsOrder(id),
      converter: (e) {
        return OrderDetailsModel.listFromJson(e["data"]["order_details"]);
      },
    );
  }
}
