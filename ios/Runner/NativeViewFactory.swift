//
//  NativeViewFactory.swift
//  Runner
//
//

import Foundation
import Flutter
import UIKit

class NativeViewFactory : NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }
    
    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return NativeView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger)
    }
}

public class NativeView : NSObject, FlutterPlatformView {
    
   
    var webURL = "https:/flutter.io/"
    var _webView : UIWebView
    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _webView = UIWebView()
        super.init()

//        if let argumentsDictionary = args as? Dictionary<String, Any> {
//            self.webURL = argumentsDictionary["webURL"] as! String
//            print("web URL:", webURL)
//        }
        _webView.loadRequest(URLRequest(url: URL(string: webURL)!))
    
    }
    

   
    public func view() -> UIView {
        return _webView
    }
}


