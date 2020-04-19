import 'package:flutter/material.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';

class FbRewarded extends StatefulWidget {
  @override
  _FbRewardedState createState() => _FbRewardedState();
}

class _FbRewardedState extends State<FbRewarded> {
  bool _isRewardedAdLoaded = false;
  bool _isRewardedVideoComplete = false;

  @override
  void initState() {
    FacebookAudienceNetwork.init(
      testingId: "974cb6d3-8998-4ab2-88dc-c3ddbfd1c7fb",
    );
    _loadRewardedVideoAd();
    super.initState();
  }

  Widget _currentAd = SizedBox(
    width: 0.0,
    height: 0.0,
  );

  _showRewardedAd() {
    if (_isRewardedAdLoaded == true)
      FacebookRewardedVideoAd.showRewardedVideoAd();
    else
      print("Rewarded Ad not yet loaded!");
  }

  void _loadRewardedVideoAd() {
    FacebookRewardedVideoAd.loadRewardedVideoAd(
      placementId: "YOUR_PLACEMENT_ID",
      listener: (result, value) {
        print("Rewarded Ad: $result --> $value");
        if (result == RewardedVideoAdResult.LOADED) _isRewardedAdLoaded = true;
        if (result == RewardedVideoAdResult.VIDEO_COMPLETE)
          _isRewardedVideoComplete = true;

        /// Once a Rewarded Ad has been closed and becomes invalidated,
        /// load a fresh Ad by calling this function.
        if (result == RewardedVideoAdResult.VIDEO_CLOSED &&
            value["invalidated"] == true) {
          _isRewardedAdLoaded = false;
          _loadRewardedVideoAd();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rewarded"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: _loadRewardedVideoAd,
          child: Text("Click and see"),
        ),
      ),
    );
  }
}
