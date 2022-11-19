import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    


      weak var registrar = self.registrar(forPlugin: "")

      let factory = NativeViewFactory(messenger: registrar!.messenger())
      registrar!.register(
          factory,
          withId: "NativeUI")
  
return super.application(application, didFinishLaunchingWithOptions: launchOptions)
      
  }

}
