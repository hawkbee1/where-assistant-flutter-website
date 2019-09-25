
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:whereassistant_io/core/domain/repositories/send_user_event_repository.dart';
import 'package:whereassistant_io/core/domain/usecases/send_user_event.dart';

class MockSendUserEventRepository extends Mock implements SendUserEventRepository {}

main() {
  SendUserEvent usecase;
  MockSendUserEventRepository mockSendUserEventRepository;

  setUp(() {
    mockSendUserEventRepository = MockSendUserEventRepository();
    usecase = SendUserEvent(mockSendUserEventRepository);
  });

  final String tCategory  = 'testCategory';
  final String tEvent  = 'testEvent';

  test('domain should send user event to repository and return null', () async {
//
    when(mockSendUserEventRepository.sendUserPageView(any)).thenAnswer((_) async => null);
    final result = await usecase(category: tCategory, event: tEvent);
//    we test result is what we expect
    expect(result, null);
//    verify() check the method has been called with the given property
    verify(mockSendUserEventRepository.sendUserEvent(tCategory, tEvent));
  });
}