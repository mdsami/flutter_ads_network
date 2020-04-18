import 'package:flutter/material.dart';
import 'package:flutteradsnetwork/Screen/HomePage.dart';
import 'package:flutteradsnetwork/facebook/fbbanner.dart';
import 'package:flutteradsnetwork/google/NativeAdvanced.dart';
import 'package:flutteradsnetwork/google/banner.dart' as bn;
import 'package:flutteradsnetwork/google/interstital.dart';
import 'package:flutteradsnetwork/google/rewarded.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hey Ads!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/Banner': (context) => bn.Banner(),
        '/interstital': (context) => interstital(),
        '/rewarded': (context) => rewarded(),
        '/nativeadvanced': (context) => NativeAdvanced(),
        '/fbbanner': (context) => FbBanner(),
      },
    );
  }
}
