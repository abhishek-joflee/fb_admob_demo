import 'dart:io';

import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    FacebookAudienceNetwork.init(
      testingId: "aed8db86-093d-4448-a51f-ddba0e315164",
      iOSAdvertiserTrackingEnabled: true,
    );
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: const Alignment(0.5, 1),
            child: FacebookNativeAd(
              placementId: "VID_HD_16_9_46S_LINK#YOUR_PLACEMENT_ID",
              adType: Platform.isAndroid
                  ? NativeAdType.NATIVE_AD
                  : NativeAdType.NATIVE_AD_HORIZONTAL,
              width: double.infinity,
              height: 300,
              backgroundColor: Colors.blue,
              titleColor: Colors.white,
              descriptionColor: Colors.white,
              buttonColor: Colors.deepPurple,
              buttonTitleColor: Colors.white,
              buttonBorderColor: Colors.white,
              keepAlive:
                  true, //set true if you do not want adview to refresh on widget rebuild
              keepExpandedWhileLoading:
                  false, // set false if you want to collapse the native ad view when the ad is loading
              expandAnimationDuraion:
                  300, //in milliseconds. Expands the adview with animation when ad is loaded
              listener: (result, value) {
                switch (result) {
                  case NativeAdResult.LOADED:
                    debugPrint("myLog: NativeAd loaded");
                    break;
                  case NativeAdResult.ERROR:
                    debugPrint("myLog: NativeAd load error");
                    break;
                  case NativeAdResult.LOGGING_IMPRESSION:
                    debugPrint("myLog: NativeAd load Impressed");
                    break;
                  case NativeAdResult.CLICKED:
                    debugPrint("myLog: NativeAd load clicked");
                    break;
                  case NativeAdResult.MEDIA_DOWNLOADED:
                    debugPrint("myLog: NativeAd meadia loaded");
                    break;
                  default:
                }
              },
            ),
          ),
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
