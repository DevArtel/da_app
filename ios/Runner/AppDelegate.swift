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

          channel.setMethodCallHandler({(call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
              if call.method == "getFlavor" {
                  let flavor = Bundle.main.infoDictionary?["Flavor"] as? String
                  result(flavor)
              } else {
                  result(FlutterMethodNotImplemented)
              }
      })
      }
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
