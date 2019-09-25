import 'package:whereassistant_io/core/domain/repositories/send_user_event_repository.dart';
import 'package:meta/meta.dart';

class SendUserPageView {
  final SendUserEventRepository repository;

  SendUserPageView(this.repository);

  Future call({
  @required String userPageView,
}) async {
    return await repository.sendUserPageView(userPageView);
  }
}