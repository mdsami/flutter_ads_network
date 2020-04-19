import 'package:startapp/startapp.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



class StartAppAds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Start APP Ads';
    return MaterialApp(
        title: title,
        home: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: ListView(
              children: <Widget>[
                ListTile(
                  title: Text('Map'),
                  leading: Icon(Icons.map),
                ),
                AdBanner(),
                
                ListTile(
                  title: Text('Photo Album'),
                  leading: Icon(Icons.photo_album),
                ),
                AdBanner(),

                ListTile(
                  title: Text('Phone'),
                  leading: Icon(Icons.phone),
                ),
              ],
            )));
  }
}
