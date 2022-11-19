import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PlatformView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver{

  var viewPlayerController;
  String viewType = 'NativeUI';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("PlatformView"),
      ),
      body:Column(
        children: [
          Expanded(child: nativeView(),),
          Container(
            color: Colors.black,
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text("Flutter view",style: TextStyle(color: Colors.white,fontSize: 16),),
                SizedBox(height: 10,),
                Text("Platform views allow you to embed native views in a flutter app, so you can apply transforms. clips. and opacity to the native"
                    "view from dart.",style: TextStyle(color: Colors.white,fontSize: 14),),
              ],
            ),
          ),
        ],
      )
    );
  }
  nativeView() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: viewType,
        creationParams: <String,dynamic>{
          "webURL":"https:/flutter.io/"
        },

        creationParamsCodec: const StandardMessageCodec(),
      );
    } else {
      return UiKitView(
        viewType: viewType,
        creationParams: <String,dynamic>{
          "webURL":"https:/flutter.io/"
        },
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
  }
}




