import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;


class NotificationService {
  static final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future init() async {
    // Android initialization settings
    tz.initializeTimeZones();
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS initialization settings
    const DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    // Combined platform settings
    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    // Initialize the plugin
    await notificationsPlugin.initialize(settings: settings);

    // Request Android 13+ notification permission
    await notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  static Future showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    // Android notification configuration
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'subscription_channel', // Channel ID
      'Subscription Reminder', // Channel Name
      channelDescription: 'Notifies user before a subscription expires',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );

    // iOS notification configuration
    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    // Combine both platform details
    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    // Show notification
    await notificationsPlugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: details,
    );
  }

  static Future scheduleNotification({
  required int id,
  required String title,
  required String body,
  required DateTime scheduledDate,
}) async {
  await notificationsPlugin.zonedSchedule(
    id: id,
    title: title,
    body:body,
    scheduledDate: tz.TZDateTime.from(scheduledDate, tz.local),
    notificationDetails:  NotificationDetails(
      android: AndroidNotificationDetails(
        'subscription_channel',
        'Subscription Reminder',
        channelDescription: 'Notifies user before a subscription expires',
        importance: Importance.max,
        priority: Priority.high,
      ),
    ),
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    
  );
}
}