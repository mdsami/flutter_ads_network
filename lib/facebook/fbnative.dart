import 'package:flutter/material.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';

class FbNative extends StatefulWidget {
  @override
  _FbNativeState createState() => _FbNativeState();
}

class _FbNativeState extends State<FbNative> {
  @override
  void initState() {
    FacebookAudienceNetwork.init(
      testingId: "974cb6d3-8998-4ab2-88dc-c3ddbfd1c7fb",
    );

    super.initState();
  }

  Widget _currentAd = SizedBox(
    width: 0.0,
    height: 0.0,
  );

  _showNativeAd() {
    setState(() {
      _currentAd = FacebookNativeAd(
        adType: NativeAdType.NATIVE_AD,
        width: double.infinity,
        height: 300,
        backgroundColor: Colors.blue,
        titleColor: Colors.white,
        descriptionColor: Colors.white,
        buttonColor: Colors.deepPurple,
        buttonTitleColor: Colors.white,
        buttonBorderColor: Colors.white,
        listener: (result, value) {
          print("Native Ad: $result --> $value");
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Native"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: _showNativeAd,
          child: Text("Click and see"),
        ),
      ),
    );
  }
}
