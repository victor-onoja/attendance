abstract class WebSocketClient {
  Stream<int> getCounterStream();
}

class FakeWebsocketClient implements WebSocketClient {
  @override
  Stream<int> getCounterStream() async* {
    int i = 0;
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      yield i++;
    }
  }
}
