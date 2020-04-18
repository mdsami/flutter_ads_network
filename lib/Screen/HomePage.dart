import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hey Ads!'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          ListView.builder(
              shrinkWrap: true,
              itemCount: AdsList.length,
              itemBuilder: (BuildContext, index) {
                return RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, "/${AdsList[index].GoTo}");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(AdsList[index].Adsname),
                      Image.network(
                        "${AdsList[index].Provider}",
                        height: size.height * 0.03,
                        width: size.width * 0.05,
                      )
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }

  List<AdsData> AdsList = [
    AdsData("Banner",
        "https://pluspng.com/img-png/google-logo-png-open-2000.png", "Banner"),
    AdsData(
        "InterStital",
        "https://pluspng.com/img-png/google-logo-png-open-2000.png",
        "interstital"),
    AdsData(
        "Rewarded",
        "https://pluspng.com/img-png/google-logo-png-open-2000.png",
        "rewarded"),
    AdsData(
        "Native Advanced",
        "https://pluspng.com/img-png/google-logo-png-open-2000.png",
        "nativeadvanced"),
    AdsData(
        "Banner",
        "https://pngimg.com/uploads/facebook_logos/facebook_logos_PNG19751.png",
        "fbbanner"),
  ];
}

class AdsData {
  final String Adsname;
  final String Provider;
  final String GoTo;

  AdsData(this.Adsname, this.Provider, this.GoTo);
}
