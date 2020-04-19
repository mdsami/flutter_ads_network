import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';

class FbBanner extends StatefulWidget {
  @override
  _FbBannerState createState() => _FbBannerState();
}

class _FbBannerState extends State<FbBanner> {
  @override
  void initState() {
    super.initState();

    FacebookAudienceNetwork.init(
      testingId: "974cb6d3-8998-4ab2-88dc-c3ddbfd1c7fb",
    );
  }

  Widget _currentAd = SizedBox(
    width: 0.0,
    height: 0.0,
  );

  _showBannerAd() {
    setState(() {
      _currentAd = FacebookBannerAd(
        bannerSize: BannerSize.STANDARD,
        listener: (result, value) {
          print("Banner Ad: $result -->  $value");
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Banner",
        ),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: _showBannerAd,
          child: Text("Click and See"),
        ),
      ),
    );
  }
}
