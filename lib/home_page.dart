import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _adLoaded = false;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    FacebookAudienceNetwork.init(
      testingId: "aed8db86-093d-4448-a51f-ddba0e315164",
      iOSAdvertiserTrackingEnabled: true,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadInterStitialAd();
  }

  _loadInterStitialAd() {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
      listener: (result, value) {
        switch (result) {
          case InterstitialAdResult.LOADED:
            _adLoaded = true;
            debugPrint("myLog: Ad loaded");
            break;
          case InterstitialAdResult.ERROR:
            _adLoaded = false;
            debugPrint("myLog: Ad load Error");
            break;
          case InterstitialAdResult.LOGGING_IMPRESSION:
            debugPrint("myLog: Ad Impressed");
            break;
          case InterstitialAdResult.DISPLAYED:
            debugPrint("myLog: Ad Displayed");
            break;
          case InterstitialAdResult.CLICKED:
            debugPrint("myLog: Ad clicked");
            break;
          case InterstitialAdResult.DISMISSED:
            debugPrint("myLog: Ad Dismissed");
            _loadInterStitialAd();
            break;
          default:
            debugPrint("unknown InterstitialAdResult");
        }
      },
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    if (_counter % 4 == 0 && _adLoaded) {
      FacebookInterstitialAd.showInterstitialAd();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'At multiple of 4, you\'ll see the interstitial ad...',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
