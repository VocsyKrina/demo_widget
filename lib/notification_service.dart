// notification_service.dart

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  static void requestPermission() async {
    final granted = await _notificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();

    print("Notification permission granted? $granted");
  }

  static Future<void> init() async {
    tz.initializeTimeZones();
    // Ask for notification permission
    if (!await Permission.notification.isGranted) {
      await Permission.notification.request();
    }
    // Ask for exact alarm permission (Android 12+)
    if (await Permission.scheduleExactAlarm.isDenied) {
      await openAppSettings();
    }

    const AndroidInitializationSettings androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsDarwin = DarwinInitializationSettings(
      requestSoundPermission: true,
      defaultPresentSound: true,
      requestAlertPermission: true,
      defaultPresentAlert: true,
      requestBadgePermission: false,
      defaultPresentBadge: false,
      defaultPresentBanner: false,
      defaultPresentList: false,
      requestCriticalPermission: false,
      requestProvisionalPermission: false,
    );
    final InitializationSettings settings = InitializationSettings(android: androidSettings, iOS: initializationSettingsDarwin);

    await _notificationsPlugin.initialize(settings);
    print("Notification :: initialize");
  }

  static Future<void> showPeriodReminder(DateTime scheduledDate) async {
    print("reminderDate :: 1 ${scheduledDate}");
    print("Local timezone: ${tz.local.name}");

    // Create or get the notification channel
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'period_channel',
      'Period Notifications',
      description: 'Reminder for upcoming period',
      importance: Importance.max,
      playSound: true,
      enableVibration: true,
    );
    await _notificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);

    final scheduledTime = tz.TZDateTime.from(scheduledDate, tz.local);
    print("Scheduled time in local timezone: $scheduledTime");
    // const AndroidNotificationDetails androidDetails = AndroidNotificationDetails('test_channel', 'Test Channel', importance: Importance.max, priority: Priority.high);

    // const NotificationDetails notificationDetails = NotificationDetails(android: androidDetails);

    // await _notificationsPlugin.show(0, 'Test Title', 'Test Body', notificationDetails);

    await _notificationsPlugin.zonedSchedule(
      0,
      '🩸 Period Reminder',
      'Your period might start tomorrow. Stay prepared!',
      tz.TZDateTime.from(scheduledDate, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'period_channel',
          'Period Notifications',
          channelDescription: 'Reminder for upcoming period',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          enableVibration: true,
          enableLights: true,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );

    print("✅ Notification scheduled! ✅");
  }

  static Future<void> cancelAll() async {
    await _notificationsPlugin.cancelAll();
  }
}
