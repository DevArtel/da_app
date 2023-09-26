import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      
      if let controller = self.window.rootViewController as? FlutterBinaryMessenger {
          let channel = FlutterMethodChannel(name: "flavor_channel", binaryMessenger: controller)

          channel.setMethodCallHandler { (call, result) in
              let flavor = Bundle.main.infoDictionary?["Flavor"]
              result(flavor)
          }
      }
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
