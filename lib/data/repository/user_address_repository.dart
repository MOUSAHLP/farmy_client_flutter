import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../core/utils/api_const.dart';
import '../../models/params/add_address_params.dart';
import '../../models/user_address_response.dart';
import '../data_resource/remote_resource/api_handler/base_api_client.dart';

class UserAddressRepository {
  static Future<Either<String, List<UserAddressModel>>> getUserAddress() {
    return BaseApiClient.get<List<UserAddressModel>>(
      url: ApiConst.getUserAddresses,
      converter: (e) {
        return UserAddressModel.listFromJson(e["data"]);
      },
    );
  }

  static Future<Either<String, UserAddressModel>> addUserAddress(
      AddAddressParams postParams) {
    if (kDebugMode) {
      print("addUserAddress");
      print(postParams.toJson());
    }

    return BaseApiClient.post<UserAddressModel>(
      url: ApiConst.addUserAddresses,
      formData: FormData.fromMap(postParams.toJson()),
      converter: (e) {
        return UserAddressModel.fromJson(e["data"]);
      },
    );
  }

  static Future<Either<String, String>> deleteAddress(int id) {
    return BaseApiClient.delete<String>(
      url: ApiConst.deleteUserAddresses(id),
      converter: (e) {
        return e['message'];
      },
    );
  }

  static Future<Either<String, String>> makeAdressFavorite(int id) {
    return BaseApiClient.post<String>(
      url: ApiConst.makeAdressFavorite(id),
      converter: (e) {
        return e['message'];
      },
    );
  }
}
