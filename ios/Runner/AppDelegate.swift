import UIKit
import Flutter
import MediaPlayer
import Kingfisher

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(_ application: UIApplication,
                              didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleIdentifier") ?? "com.xiaomianstudio.xiaomian";
        let playChannel = FlutterMethodChannel(name: "\(name)/play",
                                                binaryMessenger: controller.binaryMessenger)
        playChannel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            // This method is invoked on the UI thread.
                guard call.method == "setNowPlayingInfo", call.arguments != nil else {
                result(FlutterMethodNotImplemented)
                return
            }
            self?.setNowPlayingInfo(result: result, arguments: call.arguments)
        })
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func setNowPlayingInfo(result: @escaping FlutterResult, arguments:Any?) {
        let flutterResult = result;
        guard let arguments = arguments as? [String:Any],
              let id = arguments["id"] as? String else {
            flutterResult(FlutterError(code: "UNAVAILABLE",
                                message: "SetNowPlayingInfo arguments error",
                                details: nil))
            return
        }
        
        //'id': "123"
        //'title': '东方红',
        //'artist': '北京合唱团',
        //'albumTitle': '新中国',
        //'artwork': 'https://cccimg.com/view.php/7ff3bd13cda0aaae9ad0de8d29411f56.jpeg'

        if let artwork = arguments["artwork"] as? String, let url = URL(string: artwork) {
            KingfisherManager.shared.retrieveImage(with: ImageResource(downloadURL: url, cacheKey: id)) { result in
                switch result {
                case .success(let value):
                    let image = MPMediaItemArtwork(boundsSize: value.image.size) { (_) -> UIImage in
                        return value.image.centerInRect()
                    }
                    MPNowPlayingInfoCenter.default().nowPlayingInfo = [
                        MPMediaItemPropertyTitle: arguments["title"] as? String ?? "",
                        MPMediaItemPropertyArtist: arguments["artist"] as? String ?? "",
                        MPMediaItemPropertyAlbumTitle: arguments["albumTitle"] as? String ?? "",
                        MPMediaItemPropertyArtwork:image
                    ]
                case .failure(_):
                    //todo: upload error
                    MPNowPlayingInfoCenter.default().nowPlayingInfo = [
                        MPMediaItemPropertyTitle: arguments["title"] as? String ?? "",
                        MPMediaItemPropertyArtist: arguments["artist"] as? String ?? "",
                        MPMediaItemPropertyAlbumTitle: arguments["albumTitle"] as? String ?? ""
                    ]
                }
                flutterResult(nil)
            }
        } else {
            MPNowPlayingInfoCenter.default().nowPlayingInfo = [
                MPMediaItemPropertyTitle: arguments["title"] as? String ?? "",
                MPMediaItemPropertyArtist: arguments["artist"] as? String ?? "",
                MPMediaItemPropertyAlbumTitle: arguments["albumTitle"] as? String ?? "",
            ]
            flutterResult(nil)
        }
    }
}


extension UIImage {
    // 截取中心正方形图片
    func centerInRect() -> UIImage {
        let height = size.height
        let width = size.width
        if height == width {
            return self
        }
        
        let wh = width > height ? height : width
        let x = (width - wh)*0.5
        let y = (height - wh)*0.5
        let rect = CGRect(x: x, y: y, width: wh, height: wh)
        return imageAtRect(rect: rect)
    }
    
    func imageAtRect(rect: CGRect) -> UIImage {
            var rect = rect
            rect.origin.x *= self.scale
            rect.origin.y *= self.scale
            rect.size.width *= self.scale
            rect.size.height *= self.scale
            let imageRef = self.cgImage!.cropping(to: rect)
            let image = UIImage(cgImage: imageRef!, scale: self.scale, orientation: self.imageOrientation)
            return image
    }
    
}

