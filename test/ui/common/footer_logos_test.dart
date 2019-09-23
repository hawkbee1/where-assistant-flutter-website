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
    Offset normandyCenter =
        tester.getCenter(find.byTooltip('Normandy French Tech logo'));
    print(normandyCenter.dx);
    print(normandyCenter.dy);
    expect(tester.getCenter(find.byTooltip('Normandy French Tech logo')),
        findsOneWidget);
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
            FooterLogos(),
          ],
        ),
      ),
    );
  }
}
