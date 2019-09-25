// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('checking home page is displayed correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
  });
}

class MyApp extends StatelessWidget{
  final title = 'Where Assistant';
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(title: Text(title),),
body: Center(child: Text(title),),
      ),
    );
  }
}

