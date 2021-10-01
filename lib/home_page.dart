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
            child: FacebookBannerAd(
              placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
              bannerSize: BannerSize.STANDARD,
              listener: (result, value) {
                switch (result) {
                  case BannerAdResult.ERROR:
                    debugPrint("Error: $value");
                    break;
                  case BannerAdResult.LOADED:
                    debugPrint("Loaded: $value");
                    break;
                  case BannerAdResult.CLICKED:
                    debugPrint("Clicked: $value");
                    break;
                  case BannerAdResult.LOGGING_IMPRESSION:
                    debugPrint("Logging Impression: $value");
                    break;
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
