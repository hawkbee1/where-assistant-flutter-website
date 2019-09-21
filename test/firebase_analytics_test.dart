// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final TestWidgetsFlutterBinding binding = TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('checking home page is displayed correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
  });
}

class MyApp extends StatelessWidget{
  final title = 'Where Assistant';
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
  FirebaseAnalyticsObserver(analytics: analytics);
  @override
  Widget build(BuildContext context) {
    try {
      analytics.logAppOpen();
      analytics.logEvent(name: 'testing analytics');
    } catch (e) {
      debugPrint('error -> $e');
    }

    // TODO: implement build
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(title: Text(title),),
body: Center(child: Text(title),),
      ),
    );
  }
  Future<void> _sendAnalyticsEvent() async {
    await analytics.logEvent(
      name: 'test_event',
      parameters: <String, dynamic>{
        'string': 'string',
        'int': 42,
        'long': 12345678910,
        'double': 42.0,
        'bool': true,
      },
    );
//    setMessage('logEvent succeeded');
  }

}

