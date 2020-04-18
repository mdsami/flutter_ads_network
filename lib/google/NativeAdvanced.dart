import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'dart:io';

const String testDevice = 'YOUR_DEVICE_ID';

class NativeAdvanced extends StatefulWidget {
  @override
  _NativeAdvancedState createState() => _NativeAdvancedState();
}

class _NativeAdvancedState extends State<NativeAdvanced> {
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    childDirected: true,
    nonPersonalizedAds: true,
  );

  NativeAd _nativeAd;

  NativeAd createNativeAd() {
    return NativeAd(
      adUnitId: NativeAd.testAdUnitId,
      factoryId: 'adFactoryExample',
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("$NativeAd event $event");
      },
    );
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    _nativeAd = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("NativeAdvanced!"),
          centerTitle: true,
        ),
        body: Center(child: RaisedButton(
          child: const Text('SHOW NATIVE'),
          onPressed: () {
            _nativeAd ??= createNativeAd();
            _nativeAd
              ..load()
              ..show(
                anchorType: Platform.isAndroid
                    ? AnchorType.bottom
                    : AnchorType.top,
              );
          },
        ))
    );
  }
}
