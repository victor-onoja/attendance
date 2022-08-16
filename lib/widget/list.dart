import 'package:flutter/material.dart';
import 'package:st8_management/model/user.dart';

class UserList extends StatefulWidget {
  final List<User> users;
  final Function(User) onDelete;

  UserList(this.users, this.onDelete);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${widget.users[index].name}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'City: ${widget.users[index].city}',
                    style: const TextStyle(fontSize: 18),
                  )
                ],
              ),
              IconButton(
                  onPressed: () => widget.onDelete(widget.users[index]),
                  icon: const Icon(Icons.delete))
            ],
          ),
        ),
      ),
      itemCount: widget.users.length,
    );
  }
}
