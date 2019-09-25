
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:whereassistant_io/core/domain/repositories/send_user_event_repository.dart';
import 'package:whereassistant_io/core/domain/usecases/send_user_page_view.dart';

class MockSendUserEventRepository extends Mock implements SendUserEventRepository {}

main() {
  SendUserPageView usecase;
  MockSendUserEventRepository mockSendUserEventRepository;

  setUp(() {
    mockSendUserEventRepository = MockSendUserEventRepository();
    usecase = SendUserPageView(mockSendUserEventRepository);
  });

  final String tUserPageView  = 'testPage';

  test('should send page view event to repository and return null', () async {
//
    when(mockSendUserEventRepository.sendUserPageView(any)).thenAnswer((_) async => null);
//    changed usecase.execute(... into usecase(... since dart use a method named call which can be run by object.call() or object()
    final result = await usecase(userPageView: tUserPageView);
//    we test result is what we expect
    expect(result, null);
//    verify() check the method has been called with the given property
    verify(mockSendUserEventRepository.sendUserPageView(tUserPageView));
  });
}