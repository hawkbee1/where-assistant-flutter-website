import 'package:usage/usage_html.dart';
import 'package:whereassistant_io/core/domain/repositories/send_user_event_repository.dart';

class SendUserEventRepositoryImpl extends SendUserEventRepository {
  Analytics analytics;
  SendUserEventRepositoryImpl(this.analytics );

  @override
  Future sendUserEvent(String category, String event) {
    // TODO: implement sendUserEvent
    return null;
  }

  @override
  Future sendUserPageView(String page) {
    // TODO: implement sendUserPageView
    return null;
  }
}