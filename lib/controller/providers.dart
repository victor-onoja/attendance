import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:st8_management/api/api.dart';
import 'package:st8_management/api/websocket.dart';
import 'package:st8_management/controller/main_list.dart';

final titleProvider = Provider<String>((ref) => 'Title');

final profileNameProvider = FutureProvider<String>(
    (ref) => getProfileUserName(ref.read(titleProvider)));

final countryProvider = FutureProvider.autoDispose<String>(((ref) async {
  String response = await getCountry();
  if (response == 'Not found') {
    ref.maintainState = false;
  } else {
    ref.maintainState = true;
  }

  String country = response;
  return country;
}));

final sessionTimeProvider = StreamProvider.family<String, String>(
    (ref, units) => getSessionTime(units));

final mainListProvider = StateNotifierProvider((ref) => UserListController([]));

final counterProvider = StateProvider.autoDispose((ref) => 0);

final webSocketClientProvider = Provider<WebSocketClient>((ref) {
  return FakeWebsocketClient();
});

final counter2Provider = StreamProvider<int>((ref) {
  final wsClient = ref.watch(webSocketClientProvider);
  return wsClient.getCounterStream();
});
