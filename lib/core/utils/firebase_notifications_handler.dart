import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pharma/bloc/tracking_bloc/tracking_bloc.dart';
import 'package:pharma/bloc/tracking_bloc/tracking_event.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/models/track_model.dart';

import '../../main.dart';
import '../../presentation/screens/order_tracking_screen/order_verify_code.dart';

void notificationTapBackground(NotificationResponse notificationResponse) {
  if (kDebugMode) {
    print('notification(${notificationResponse.id}) action tapped: '
        '${notificationResponse.actionId} with'
        ' payload: ${notificationResponse.payload}');
  }
  if (notificationResponse.input?.isNotEmpty ?? false) {
    if (kDebugMode) {
      print(
          'notification action tapped with input: ${notificationResponse.input}');
    }
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // await Firebase.initializeApp();
}

class FirebaseNotificationsHandler {
  static final FirebaseNotificationsHandler _firebase =
      FirebaseNotificationsHandler._internal();

  factory FirebaseNotificationsHandler() {
    return _firebase;
  }

  FirebaseNotificationsHandler._internal();

  bool _requestToken = true;
  RemoteMessage? newMessage;
  TrackingBloc? bloc;
  String? fcmToken;

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<String?> refreshFcmToken() async {
    String? currentToken = await _firebaseMessaging.getToken();
    if (kDebugMode) print('FCM Token: $currentToken');
    return currentToken;
  }

  Future<void> init() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      importance: Importance.max,
    );
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    var android = const AndroidInitializationSettings(
        '@drawable/ic_stat_ic_notification');
    var ios = const DarwinInitializationSettings();
    var platform = InitializationSettings(android: android, iOS: ios);

    flutterLocalNotificationsPlugin.initialize(platform,
        onDidReceiveNotificationResponse: (payload) {
      if (newMessage != null && newMessage!.data["status"] == "3") {
        navigatorKey.currentState!.push(MaterialPageRoute(
          builder: (context) {
            return OrderVerifyCode(
                orderId: int.parse(newMessage!.data["order_id"]));
          },
        ));
      }
    }, onDidReceiveBackgroundNotificationResponse: notificationTapBackground);

    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    _firebaseMessaging.requestPermission(sound: true, alert: true, badge: true);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("hereeeeeeeeeeeeeeee");
      print('OpenedApp ${message.data["body"]}');
      RemoteNotification? notification = message.notification;
      newMessage = message;
      print("new Message::: ${newMessage}");

      if (notification != null) {
        if (message.data["order_status"] != null && bloc != null) {
          // update the tracking screen
          TrackingModel trackingModel = TrackingModel(
              driverPhone: message.data["driver_phone"].toString(),
              status: int.parse(message.data["order_status"].toString()));

          bloc!.add(UpdateOrderStatus(
              orderId: int.parse(message.data["order_id"].toString()),
              trackingModel: trackingModel));
        } else if (message.data["status"] != null &&
            message.data["status"] == 3) {
          print("yesssssssssssssssss");
          navigatorKey.currentState!.push(MaterialPageRoute(
            builder: (context) {
              return OrderVerifyCode(orderId: message.data["id"]);
            },
          ));
        }

        flutterLocalNotificationsPlugin
            .show(
                notification.hashCode,
                notification.title,
                notification.body,
                NotificationDetails(
                  android: AndroidNotificationDetails(
                    channel.id,
                    channel.name,
                    // icon: android!.smallIcon,
                    showWhen: true,

//                    color: ColorManager.primaryColor,
                  ),
                ))
            .catchError((onError) {
          if (kDebugMode) {
            print("hello");
            print(onError);
          }
        });
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('background not terminated');
      }
      navigatorKey.currentState!.push(MaterialPageRoute(
        builder: (context) {
          return OrderVerifyCode(orderId: int.parse(message.data["order_id"]));
        },
      ));
      // processMessage(message);
    });

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      //App Closed
      if (kDebugMode) {
        print("FirebaseMessaging.getInitialMessage");
      }
      if (message != null && message.data["status"] == "3") {
        navigatorKey.currentState!.push(MaterialPageRoute(
          builder: (context) {
            return OrderVerifyCode(
                orderId: int.parse(message.data["order_id"]));
          },
        ));

        // processMessage(message);
      }
    });

    // for iOS only
    _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    _firebaseMessaging.getToken().then((token) {
      if (kDebugMode) print('FCM Token: $token');
      // _registerToken(token!);
    });

    // _firebaseMessaging.onTokenRefresh.listen(_registerToken);
  }

  // void _registerToken(String token) {
  //   if (_requestToken) {
  //     _requestToken = false;
  //     ApiClient client = PaprikaApiClient();
  //     NotificationsApi api = NotificationsApi(client);
  //     api
  //         .apiServicesAppNotificationsRegisterFirebaseNotificationsPost(
  //             token: token)
  //         .then((_) {
  //       _requestToken = true;
  //     }).catchError((error) {
  //       _requestToken = true;
  //     });
  //   }
  // }

  // void processMessage(RemoteMessage? model) {
  //   if (model == null) return;
  //   final data = model.data["Model"];
  //   int type;
  //   try {
  //     type = int.parse(model.data['NotificationName'] as String);
  //   } catch (e) {
  //     return;
  //   }

  //   switch (type) {
  //     case NotificationType.reservationApprovedInt:
  //       Get.to(ReservationsScreen());
  //       break;

  //     case NotificationType.newRestaurantAddedInt:
  //       final int? restId =
  //       (json.decode(data as String))["RestaurantId"] as int?;
  //       if (restId != null && restId > 0) {
  //         navigationController.toRestaurantScreen(restaurantId: restId);
  //       }
  //       break;
  //   }
  // }

  Future<dynamic> _onNotificationDialogClick(NotificationResponse? message) {
    if (newMessage != null) {
      // processMessage(newMessage);
      return Future<dynamic>.value();
    } else {
      return Future<dynamic>.value();
    }
  }
}
