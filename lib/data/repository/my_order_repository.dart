import 'package:dartz/dartz.dart';
import 'package:pharma/data/data_resource/local_resource/data_store.dart';
import 'package:pharma/models/basket_model.dart';
import 'package:pharma/models/params/get_basket_params.dart';
import 'package:pharma/models/params/get_edit_product_params.dart';
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
      queryParameters: {
        'lang': DataStore.instance.lang,
      },
      converter: (e) {
        return MyOrderResponse.listFromJson(e["data"]);
      },
    );
  }

  static Future<Either<String, List<MyOrderResponse>>> getMyOrderHistory() {
    return BaseApiClient.get<List<MyOrderResponse>>(
      url: ApiConst.getMyOrderHistory,
      queryParameters: {
        'lang': DataStore.instance.lang,
      },
      converter: (e) {
        return MyOrderResponse.listFromJson(e["data"]);
      },
    );
  }

  static Future<Either<String, DetailsResponse>> getDetailsOrder(int id) {
    return BaseApiClient.get<DetailsResponse>(
      url: ApiConst.getDetailsOrder(id),
      queryParameters: {
        'lang': DataStore.instance.lang,
      },
      converter: (e) {
        return DetailsResponse.fromJson(e["data"]);
      },
    );
  }

  static Future<Either<String, String>> deleteOrder(int id) {
    return BaseApiClient.delete<String>(
      url: ApiConst.deleteOrder(id),
      queryParameters: {
        'lang': DataStore.instance.lang,
      },
      converter: (e) {
        return e['message'];
      },
    );
  }

  static Future<Either<String, String>> editOrder(
      int id, List<ProductEditPrams> product) {
    print("============edit order");
    print(ProductEditPrams.toJsonCardList(product));
    print("===============product");
    print(product);
    return BaseApiClient.put<String>(
      url: ApiConst.deleteOrder(id),
      queryParameters: {
        "products": ProductEditPrams.toJsonCardList(product),
        'lang': DataStore.instance.lang,
      },
      converter: (e) {
        return e['message'];
      },
    );
  }

  static Future<Either<String, List<ProductResponse>>> showBasket(
      List<int> basketModelStore) {
    print("============edit order");
    print(basketModelStore);
    print("===============product");
    return BaseApiClient.post<List<ProductResponse>>(
      url: ApiConst.showBasket,
      queryParameters: {
        'lang': DataStore.instance.lang,
      },
      formData: {"products": basketModelStore},
      converter: (e) {
        return ProductResponse.listFromJson(e["data"]);
      },
    );
  }

  static Future<Either<String, Map<String, dynamic>>> getCartPrices(
      List<GetBasketParams> basket) {
    var data = {};
    basket.forEach((element) {
      data["${element.id}"] = element.products;
    });

    return BaseApiClient.post<Map<String, dynamic>>(
      url: ApiConst.getCartPrices,
      formData: data,
      queryParameters: {
        'lang': DataStore.instance.lang,
      },
      converter: (e) {
        return GetBasketParams.getCartPriceResponse(e["data"]);
      },
    );
  }
}
