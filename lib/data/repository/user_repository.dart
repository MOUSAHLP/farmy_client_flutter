import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../core/utils/api_const.dart';
import '../../models/login_response.dart';
import '../../models/otp_verify_response.dart';
import '../../models/params/forget_password_params.dart';
import '../../models/params/login_params.dart';
import '../../models/params/otp_confirm_params.dart';
import '../../models/params/sign_up_params.dart';
import '../data_resource/local_resource/data_store.dart';
import '../data_resource/remote_resource/api_handler/base_api_client.dart';

class UserRepository {
  Future<Either<String, LoginResponse>> logIn(
      {LoginParams? loginParams}) async {
    return BaseApiClient.post<LoginResponse>(
        url: ApiConst.login,
        formData:loginParams?.toJson(),
        converter: (e) {
          return LoginResponse.fromJson(e['data']);
        });
  }

  void deleteToken() async {
    DataStore.instance.deleteToken();
  }

  Future<bool> hasToken() async {
    return DataStore.instance.hasToken;
  }

  void saveToken(String token) {
    DataStore.instance.setToken(token);
  }

  Future<Either<String, OtpVerifyResponse>> signUpPhoneNumber(
      String phoneNumber) async {
    return BaseApiClient.post<OtpVerifyResponse>(
        url: ApiConst.generateOtp,
        formData:  {
          "phone": phoneNumber,
        },
        converter: (e) {
          return OtpVerifyResponse.fromJson(e['data']);
        });
  }
  Future<Either<String, bool>> confirmOtp(
      OtpConfirmParams? otpConfirmParams) async {
    return BaseApiClient.post<bool>(
        url: ApiConst.verifyOtp,
        queryParameters: otpConfirmParams?.toJson(),
        converter: (e) {
          return true;
        });
  }
  Future<Either<String, bool>> forgetPassword(
      ForgetPasswordParams forgetPasswordParams) async {
    return BaseApiClient.post<bool>(
        url: ApiConst.changePassword,
        formData: forgetPasswordParams.toJson(),
        converter: (e) {
          return true;
        });
  }

  Future<Either<String, bool>> logout() async {
    return BaseApiClient.post<bool>(
        url: ApiConst.logout,
        converter: (e) {
          return true;
        });
  }
  Future<Either<String, String>> signUp(
      SignUpParams? signUpParams) async {

    return BaseApiClient.post<String>(
        url: ApiConst.signUp,

        formData: FormData.fromMap(signUpParams!.toJson()),
        converter: (e) {
          return e['data']['name'];
        });
  }
}
