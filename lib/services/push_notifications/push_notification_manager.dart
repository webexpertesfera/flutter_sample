import 'dart:convert';
import 'package:flutter_sample/constants/export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_sample/constants/route_arguments.dart';

class PushNotificationManager {
  static bool isComingFromNotification = false;
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static String? fcmToken;

  static init() async {
    await notificationPermission();
    await getToken();
    await getIntialMessage();
    await onMessage();
    await onAppOpened();
    await backGroundMessage();
  }

  static getToken() async {

    fcmToken = await messaging.getToken()??"";
    if (fcmToken != null) {
      PreferenceManger.saveFcmToken(fcmToken);
      debugPrint("fcm Token==>  $fcmToken");
    }
  }

  static notificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    debugPrint('User granted permission: ${settings.authorizationStatus}');
    await messaging.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
  }

  static onMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      debugPrint('Got a message whilst in the foreground!');
      debugPrint("message2  listen $message");
      debugPrint('Message2 listen: ${message.data}');
      if (message.notification != null) {
        debugPrint('Message also contained a notification: ${message.notification?.title}');
        debugPrint('Message also contained a notification: ${message.notification?.body}');
      }
      var androids = const AndroidInitializationSettings('mipmap/ic_launcher');
      var ios = DarwinInitializationSettings();
      var platform = InitializationSettings(android: androids, iOS: ios);

      await flutterLocalNotificationsPlugin.initialize(
        platform,
        // onDidReceiveBackgroundNotificationResponse: (details) {
        //   debugPrint("message2  details ${details.toString()}");
        //   debugPrint("message2  listen ${message.toMap()}");
        //   debugPrint("message2  listen ${message.data}");
        // },
        onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
        onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) {
          notificationRedirection(message);
        },
      );
      if (GetPlatform.isAndroid) {
        var androidPlatformChannelSpecifics = AndroidNotificationDetails(
          'com.app.fanbuzz',
          AppStrings.appName,
          importance: Importance.max,
          groupKey: AppStrings.appName,
          setAsGroupSummary: true,
          groupAlertBehavior: GroupAlertBehavior.all,
          playSound: true,
          enableVibration: true,
        );
        var iOSPlatformChannelSpecifics = DarwinNotificationDetails();
        var platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
        await flutterLocalNotificationsPlugin
            .show(
              1,
              message.notification?.title ?? "",
              // message.data.toString(),
              message.notification?.body ?? "",
              platformChannelSpecifics,
              payload: jsonEncode(message.data),
            )
            .onError((error, stackTrace) => debugPrint(error.toString()));
      }
    });
  }

  static void notificationTapBackground(NotificationResponse notificationResponse) {
    print('notification(${notificationResponse.id}) action tapped: '
        '${notificationResponse.actionId} with'
        ' payload: ${notificationResponse.payload}');
    if (notificationResponse.input?.isNotEmpty ?? false) {
      print('notification action tapped with input: ${notificationResponse.input}');
    }
  }

  static onAppOpened() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? event) {
      if (event != null) {
        debugPrint("message2  openapp ${event.data['type']}");
        notificationRedirection(
          event,
        );
      }
    });
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    debugPrint("Handling a background message: ${message.messageId}");
  }

  static getIntialMessage() async {
    await Future.delayed(const Duration(seconds: 1));
    messaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        isComingFromNotification = true;
        debugPrint("App is opened from Notification when app was killed");

        notificationRedirection(message);
      }
    });
  }

  static notificationRedirection(RemoteMessage message) {
    var action = message.data['type'];
    if (action == null || action.isEmpty) {
      return;
    }
    switch (action) {
      case 'helpdesk':
        if (Get.currentRoute == AppRoutes.chatScreen) {
          Get.back();
        }

        Get.toNamed(AppRoutes.chatScreen, arguments: {keyId: jsonDecode(message.data['redirect_data'])['help_id']});
        break;

      case 'category':
        if (Get.isRegistered<MainController>() == true) {
          Get.delete<MainController>();
          Get.offAllNamed(AppRoutes.mainScreen, arguments: {keyIndex: 2});
        } else {
          Get.offAllNamed(AppRoutes.mainScreen, arguments: {keyIndex: 2});
        }
        break;

      case 'card':
        if (Get.isRegistered<MainController>() == true) {
          Get.delete<MainController>();
          Get.offAllNamed(AppRoutes.mainScreen, arguments: {keyIndex: 2});
        } else {
          Get.offAllNamed(AppRoutes.mainScreen, arguments: {keyIndex: 2});
        }
        break;

      default:
        debugPrint('Unknown notification action: $action');
        break;
    }
  }

  static backGroundMessage() {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}

/*
keytool -genkey -v -keystore key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload

 */