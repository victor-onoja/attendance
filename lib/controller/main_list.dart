import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:st8_management/model/user.dart';

class UserListController extends StateNotifier<List<User>> {
  UserListController(List list) : super([]);

  addUser(User user) {
    state = [...state, user];
  }

  deleteUser(User user) {
    state = state.where((element) => element.name != user.name).toList();
  }
}
