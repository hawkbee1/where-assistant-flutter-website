import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:whereassistant_io/ui/common/footer_logos.dart';

main() {
  testWidgets('checking footer logos are displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.byTooltip('French Tech logo'), findsOneWidget);
    expect(find.byTooltip('Normandy French Tech logo'), findsOneWidget);
    expect(find.byTooltip('Flutter logo'), findsOneWidget);
//    the middle logo is at center ?
//        need finish writing this test ore trying golden test (compare app screen with image)
    Offset normandyCenter =
        tester.getCenter(find.byTooltip('Normandy French Tech logo'));
    print(normandyCenter.dx);
    int x = normandyCenter.dx.floor();
    print(normandyCenter.dy);
    int y = normandyCenter.dy.floor();
    expect(x, equals(366));
    expect(y, equals(103));
  });
}

class MyApp extends StatelessWidget {
  final title = 'Where Assistant';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: Text(title),
            ),
            FooterLogos(200.0),
          ],
        ),
      ),
    );
  }
}
