// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:whereassistant_io/main.dart';

void main() {
  final TestWidgetsFlutterBinding binding = TestWidgetsFlutterBinding.ensureInitialized();
  final List surfaceSizes = [[800.0,600.0], [400.0,300.0], [200.0,150.0], [100.0,75.0]];
  testWidgets('checking home page is displayed correctly', (WidgetTester tester) async {
    for(var i = 0; i < surfaceSizes.length; i++) {
      Size size = Size(surfaceSizes[i][0], surfaceSizes[i][1]);
      await checkHomePage(tester, size, binding);
    }
  });
}

Future checkHomePage(WidgetTester tester, Size size, TestWidgetsFlutterBinding binding) async {
//    setting the size of the screen
  await binding.setSurfaceSize(size);
  // Build our app and trigger a frame.
  await tester.pumpWidget(MyApp());

  // Verify that our title in appBar is Where Assistant.
  expect(find.text('Where Assistant'), findsOneWidget);
  // checking marketing text
  expect(find.text('It’s now easy to find things you stored month ago'), findsOneWidget);

  // Tap the on the play store link.
  await tester.tap(find.byTooltip('Get it on Google Play'));
  await tester.pump();

  // check previous tests still OK after pressing the link.
  expect(find.text('Where Assistant'), findsOneWidget);
  expect(find.text('It’s now easy to find things you stored month ago'), findsOneWidget);
  //    expect(find.text('tidying'), findsOneWidget);
}