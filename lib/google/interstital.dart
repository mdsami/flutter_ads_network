import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
const String testDevice = 'MobileId';
class interstital extends StatefulWidget {
  @override
  _interstitalState createState() => _interstitalState();
}

class _interstitalState extends State<interstital> {
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    nonPersonalizedAds: true,
    keywords: <String>['Game', 'Mario'],
  );

  InterstitialAd _interstitialAd;



  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
        adUnitId: InterstitialAd.testAdUnitId,

        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("IntersttialAd $event");
        });
  }

  @override
  void initState() {
    FirebaseAdMob.instance.initialize(appId: BannerAd.testAdUnitId);

    super.initState();
  }

  @override
  void dispose() {

    _interstitialAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("interstital"),
      ),
      body: Center(
          child: RaisedButton(
            child: Text('Click and See'),
            onPressed: () {
              createInterstitialAd()
                ..load()
                ..show();
            },
          )),
    );
  }
}