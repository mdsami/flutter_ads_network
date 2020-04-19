import 'package:flutter/material.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';

class FbInterStitial extends StatefulWidget {
  @override
  _FbInterStitialState createState() => _FbInterStitialState();
}

class _FbInterStitialState extends State<FbInterStitial> {
  @override
  void initState() {
    FacebookAudienceNetwork.init(
      testingId: "974cb6d3-8998-4ab2-88dc-c3ddbfd1c7fb",
    );
    _loadInterstitialAd();
    super.initState();
  }

  Widget _currentAd = SizedBox(
    width: 0.0,
    height: 0.0,
  );

  _showInterstitialAd() {
    if (_isInterstitialAdLoaded == true)
      FacebookInterstitialAd.showInterstitialAd();
    else
      print("Interstial Ad not yet loaded!");
  }

  bool _isInterstitialAdLoaded = false;

  void _loadInterstitialAd() {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: "YOUR_PLACEMENT_ID",
      listener: (result, value) {
        print("Interstitial Ad: $result --> $value");
        if (result == InterstitialAdResult.LOADED)
          _isInterstitialAdLoaded = true;

        /// Once an Interstitial Ad has been dismissed and becomes invalidated,
        /// load a fresh Ad by calling this function.
        if (result == InterstitialAdResult.DISMISSED &&
            value["invalidated"] == true) {
          _isInterstitialAdLoaded = false;
          _loadInterstitialAd();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InterStitial"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: _showInterstitialAd,
          child: Text("Click and see"),
        ),
      ),
    );
  }
}
