import 'package:whereassistant_io/core/domain/repositories/send_user_event_repository.dart';
import 'package:meta/meta.dart';

class SendUserEvent {
  final SendUserEventRepository repository;

  SendUserEvent(this.repository);

  Future call({
  @required String category,
    @required String event,
}) async {
    return await repository.sendUserEvent(category, event);
  }
}