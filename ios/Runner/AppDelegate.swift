import Flutter
import UIKit

// 1

import flutter_local_notifications

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // 2
    FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
    GeneratedPluginRegistrant.register(with: registry)}

    GeneratedPluginRegistrant.register(with: self)

    //3
    if #available(IOS 10.0, *){
      UNUserNotificationCenter.current().delegate = self as? UNUserNotification
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
