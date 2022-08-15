import 'package:flutter/material.dart';
import 'package:st8_management/model/user.dart';
import 'package:st8_management/widget/list.dart';

class ListScreen extends StatefulWidget {
  final List<User> users;
  final Function(User) onDelete;

  ListScreen(this.users, this.onDelete);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  deleteUser(User user) {
    setState(() {
      widget.onDelete(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff36382E),
      appBar: AppBar(
        title: const Text(
          'Users',
          style: TextStyle(color: Color(0xffE6E49F)),
        ),
        backgroundColor: const Color(0xff92140C),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: UserList(widget.users, deleteUser),
      ),
    );
  }
}
