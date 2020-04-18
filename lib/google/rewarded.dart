import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
const String testDevice = 'YOUR_DEVICE_ID';
class rewarded extends StatefulWidget {
  @override
  _rewardedState createState() => _rewardedState();
}

class _rewardedState extends State<rewarded> {
  int _coins = 0;

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    childDirected: true,
    nonPersonalizedAds: true,
  );

  @override
  void initState() {
    RewardedVideoAd.instance.listener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      if (event == RewardedVideoAdEvent.rewarded) {
        setState(() {
          _coins += rewardAmount;
        });
      }
    };
    RewardedVideoAd.instance.load(
        adUnitId: RewardedVideoAd.testAdUnitId,
        targetingInfo: targetingInfo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rewarded!"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: RaisedButton(
              child: const Text('SHOW REWARDED VIDEO'),
              onPressed: () {
                RewardedVideoAd.instance.show();
              },
            ),
          ),

          Text("You have $_coins coins."),



        ],
      ),
    );
  }
}
