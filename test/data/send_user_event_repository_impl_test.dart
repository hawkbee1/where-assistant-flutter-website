@TestOn('chrome')
import 'package:flutter/rendering.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:usage/usage_html.dart';
import 'package:whereassistant_io/core/data/repository_implementations/send_user_event_repository_impl.dart';
// declare mocking class
class MockAnalytics extends Mock implements AnalyticsHtml {}

main () {
print('sdpokfspdof');
  //  declare vars
  final String tPageView = "test/page";
//mock Analytics
  MockAnalytics mockAnalytics;
  SendUserEventRepositoryImpl sendUserEventRepositoryImpl;

//initialize var
  setUp(() {
//    init Analytics
  mockAnalytics = MockAnalytics();
  sendUserEventRepositoryImpl = SendUserEventRepositoryImpl(mockAnalytics);
  });
//  run test
test('should send page path/name to Future and return null ', () async {
  when(mockAnalytics.sendScreenView(any)).thenAnswer((_) async => null);
  final result = await sendUserEventRepositoryImpl.sendUserPageView(tPageView);
  expect(result, equals('toto'));
  verify(mockAnalytics.sendScreenView(tPageView));
});
debugPrint('sdpoifjsdpofpds');
}