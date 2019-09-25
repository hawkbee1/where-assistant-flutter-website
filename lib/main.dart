import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:whereassistant_io/ui/common/footer_logos.dart';
import 'package:whereassistant_io/ui/common/play_store_banner.dart';
import 'package:usage/usage_html.dart';

Analytics _analytics;
String _lastUa;
int _count = 0;

void main() => runApp(MyApp());

Analytics getAnalytics() {
  if (_analytics == null) {
    _lastUa = 'UA-110024239-1';
    _analytics = new AnalyticsHtml(_lastUa, 'whereassistant', '3.0');
    _analytics.sendScreenView('homePage');
    _analytics.sendEvent('visit', 'homePage');
  }

  return _analytics;
}

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
    Analytics analytics = getAnalytics();
    double width = MediaQuery.of(context).size.width;
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(fit: FlexFit.loose, child: new PlayStoreBanner()),
                  ],
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'When tidying up your things you just take pictures of it, where you put it. '
                        "Later when you need your things but don't remember where it is... just ask your Where Assistant. It’s amazing with speech recognition.\n"),
                  ),
                ),
                FooterLogos(width),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
