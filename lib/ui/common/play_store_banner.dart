import 'package:flutter/material.dart';
import 'package:usage/usage_html.dart';
import 'package:whereassistant_io/plugins/url_launcher/url_launcher.dart';

class PlayStoreBanner extends StatelessWidget {
  const PlayStoreBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final  Analytics _analytics = AnalyticsHtml('UA-110024239-1', 'whereassistant', '3.0');
    return Tooltip(
      message: 'Get it on Google Play',
      child: InkWell(
        child: Image.asset('assets/google-play-badge.png'),
        onTap: () {
          try {
            _analytics.sendEvent('mobileApp', 'playStoreHomePage');
            UrlUtils.open(
                'https://play.google.com/store/apps/details?id=io.whereassistant.whereassistant&pcampaignid=MKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1');
          } catch (e) {
            print('Error -> $e');
          }
        },
      ),
    );
  }
}
