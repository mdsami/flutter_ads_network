import 'package:flutter/material.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';

class FbInStream extends StatefulWidget {
  @override
  _FbInStreamState createState() => _FbInStreamState();
}

class _FbInStreamState extends State<FbInStream> {
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

  _showInStreamAd() {
    setState(() {
      _currentAd = FacebookInStreamVideoAd(
        height: 300,
        listener: (result, value) {
          print("In-Stream Ad: $result -->  $value");
          if (result == InStreamVideoAdResult.VIDEO_COMPLETE) {
            setState(() {
              _currentAd = SizedBox(
                height: 0,
                width: 0,
              );
            });
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("inStream"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: _showInStreamAd,
          child: Text("Click and see"),
        ),
      ),
    );
  }
}
