import 'package:flutter/material.dart';
import 'package:flutteradsnetwork/Screen/HomePage.dart';
import 'package:flutteradsnetwork/facebook/fbbanner.dart';
import 'package:flutteradsnetwork/facebook/fbinstream.dart';
import 'package:flutteradsnetwork/facebook/fbinterstitial.dart';
import 'package:flutteradsnetwork/facebook/fbnative.dart';
import 'package:flutteradsnetwork/facebook/fbnativebanner.dart';
import 'package:flutteradsnetwork/facebook/fbrewarded.dart';
import 'package:flutteradsnetwork/startapp/StartAppAds.dart';
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
        '/fbnative': (context) => FbNative(),
        '/fbnativebanner': (context) => FbNativeBanner(),
        '/fbinterstitial': (context) => FbInterStitial(),
        '/fbrewarded': (context) => FbRewarded(),
        '/fbinstream': (context) => FbInStream(),
        '/startapp': (context) => StartAppAds(),
      },
    );
  }
}
