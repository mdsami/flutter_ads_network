import 'package:flutter/material.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
class FbNativeBanner extends StatefulWidget {
  @override
  _FbNativeBannerState createState() => _FbNativeBannerState();
}

class _FbNativeBannerState extends State<FbNativeBanner> {

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

  _showNativeBannerAd() {
    setState(() {
      _currentAd = FacebookNativeAd(
        adType: NativeAdType.NATIVE_BANNER_AD,
        bannerAdSize: NativeBannerAdSize.HEIGHT_100,
        width: double.infinity,
        backgroundColor: Colors.blue,
        titleColor: Colors.white,
        descriptionColor: Colors.white,
        buttonColor: Colors.deepPurple,
        buttonTitleColor: Colors.white,
        buttonBorderColor: Colors.white,
        listener: (result, value) {
          print("Native Banner Ad: $result --> $value");
        },
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Native Banner"),),
      body: Center(
        child: RaisedButton(onPressed: _showNativeBannerAd,child: Text("Click and see"),),
      ),
    );
  }
}
