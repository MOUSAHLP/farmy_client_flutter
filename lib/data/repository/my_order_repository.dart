import 'package:dartz/dartz.dart';

import '../../core/utils/api_const.dart';
import '../../models/my_order_response.dart';
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
}
