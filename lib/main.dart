import 'package:flutter/material.dart';

import 'home_page.dart';

void main() async {
  // await FacebookAudienceNetwork.init(
  //   testingId: "a2d5521b-8bad-4b85-b597-bc72d9e0e16e",
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
