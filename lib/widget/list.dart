import 'package:flutter/material.dart';
import 'package:st8_management/model/user.dart';

class UserList extends StatelessWidget {
  final List<User> users;
  final Function(User) onDelete;

  UserList(this.users, this.onDelete);

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
                    'Name: ${users[index].name}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'City: ${users[index].city}',
                    style: const TextStyle(fontSize: 18),
                  )
                ],
              ),
              IconButton(
                  onPressed: () => onDelete(users[index]),
                  icon: const Icon(Icons.delete))
            ],
          ),
        ),
      ),
      itemCount: users.length,
    );
  }
}
