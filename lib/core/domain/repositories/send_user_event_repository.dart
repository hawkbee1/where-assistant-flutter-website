abstract class SendUserEventRepository {
  Future sendUserPageView(String page);
  Future sendUserEvent(String category, String event);
}