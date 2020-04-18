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
      body: ListView.builder(
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
                    "https://pluspng.com/img-png/google-logo-png-open-2000.png",
                    height: size.height * 0.03,
                    width: size.width * 0.05,
                  )
                ],
              ),
            );
          }),
    );
  }

  List<AdsData> AdsList = [
    AdsData("Banner", "Google", "Banner"),
    AdsData("InterStital", "Google", "interstital"),
    AdsData("Rewarded", "Google", "rewarded"),
    AdsData("Native Advanced", "Google", "nativeadvanced"),
  ];
}

class AdsData {
  final String Adsname;
  final String Provider;
  final String GoTo;

  AdsData(this.Adsname, this.Provider, this.GoTo);
}
