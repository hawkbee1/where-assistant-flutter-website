import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'plugins/url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final title = 'Where Assistant';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        secondaryHeaderColor: Colors.green,
      ),
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Stack(
          children: <Widget>[
            Container(child: Image.asset('assets/icon-192x192.png')),
            Center(child: Text(widget.title)),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'It’s now easy to find things you stored month ago',
                  ),
                ),
                Tooltip(
                  message: 'Get it on Google Play',
                  child: InkWell(
                    child: Image.asset('assets/google-play-badge.png'),
                    onTap: () {
                      try {
                        UrlUtils.open(
                            'https://play.google.com/store/apps/details?id=io.whereassistant.whereassistant&pcampaignid=MKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1');
                      } catch (e) {
                        print('Error -> $e');
                      }
                    },
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'When tidying up your things you just take pictures of it, where you put it. '
                        "Later when you need your things but don't remember where it is... just ask your Where Assistant. It’s amazing with speech recognition.\n"),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                        child: Image.asset('assets/Logo_French_Tech.svg.png')),
                    Flexible(
                        child: Image.asset('assets/normandy_french_tech.jpg')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
