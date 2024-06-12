import 'package:dartz/dartz.dart';
import 'package:pharma/data/data_resource/local_resource/data_store.dart';
import '../../core/utils/api_const.dart';
import '../../models/notification_model.dart';
import '../data_resource/remote_resource/api_handler/base_api_client.dart';
class NotificationRepository {
  static Future<Either<String, List<NotificationModel>>> getNotifications(int type) {
    return BaseApiClient.get<List<NotificationModel>>(
        url: ApiConst.getNotifications(type),
        queryParameters: {
          'lang': DataStore.instance.lang,
        },
        converter: (e) {
          return NotificationModel.listFromJson(e["data"]);
        });
  }
  static Future<Either<String, bool>> deleteNotification( int id) {
    return BaseApiClient.delete<bool>(
      url: ApiConst.deleteNotifications(id),
      queryParameters: {
        'lang': DataStore.instance.lang,
      },
      converter: (e) {
        return true;
      },

    );
  }


}
