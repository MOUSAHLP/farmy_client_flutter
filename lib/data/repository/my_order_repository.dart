import 'package:dartz/dartz.dart';
import '../../core/utils/api_const.dart';
import '../../models/my_order_response.dart';
import '../../models/order_details_model.dart';
import '../../models/params/product_edit_params.dart';
import '../../models/product_response.dart';
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

  static Future<Either<String, String>> deleteOrder( int id) {
    return BaseApiClient.delete<String>(
      url: ApiConst.deleteOrder(id),

      converter: (e) {
        return e['message'];
      },

    );
  }
  static Future<Either<String, String>> editOrder( int id,List<ProductEditPrams> product) {
   print("============edit order");
   print(ProductEditPrams.toJsonCardList(product));
   print("===============product");
   print(product);
    return BaseApiClient.put<String>(
      url: ApiConst.deleteOrder(id),
      queryParameters: {
        "products":ProductEditPrams.toJsonCardList(product)},
      converter: (e) {
        return e['message'];
      },

    );
  }
  static Future<Either<String, List<ProductResponse>>> showBasket( List<int> basketModelStore ) {
   print("============edit order");
   print(basketModelStore);
   print("===============product");

    return BaseApiClient.post<List<ProductResponse>>(
      url: ApiConst.showBasket,
      formData:{
        "products":basketModelStore} ,

      converter: (e) {
        return ProductResponse.listFromJson(e["data"]);
      },

    );
  }

}
