// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:whereassistant_io/main.dart';

void main() {
  testWidgets('checking home page is displayed', (WidgetTester tester) async {
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
  });
}
