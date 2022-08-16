import 'package:flutter/material.dart';
import 'package:st8_management/model/user.dart';
import 'package:st8_management/screens/list_screen.dart';
import 'package:st8_management/widget/button.dart';
import 'package:st8_management/widget/input.dart';
import 'package:st8_management/widget/list.dart';

class Page1 extends StatefulWidget {
  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  TextEditingController _name = TextEditingController();
  TextEditingController _city = TextEditingController();

  List<User> userList = [];

  addUser(User user) {
    setState(() {
      userList.add(user);
    });
  }

  deleteUser(User user) {
    setState(() {
      userList.removeWhere((_user) => _user.name == _user.name);
    });
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff36382E),
      appBar: AppBar(
        backgroundColor: const Color(0xff92140C),
        title: const Text(
          'Test Riverpod',
          style: TextStyle(color: Color(0xffE6E49F)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        key: _formkey,
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Header',
                style: TextStyle(fontSize: 30, color: Color(0xffBDB4BF)),
              ),
              const SizedBox(height: 16),
              FormInput(
                  labelText: 'Name',
                  onSaved: (String? value) {
                    _name = value! as TextEditingController;
                  }),
              const SizedBox(height: 16),
              FormInput(
                  labelText: 'City',
                  onSaved: (String? value) {
                    _city = value! as TextEditingController;
                  }),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                      text: 'Add',
                      onPressed: () {
                        if (!_formkey.currentState!.validate()) {
                          return _formkey.currentState!.save();
                        }

                        addUser(User(
                          city: _name.text,
                          name: _city.text,
                        ));
                      }),
                  const SizedBox(
                    width: 8,
                  ),
                  Button(
                      text: 'List',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ListScreen(userList, deleteUser),
                            ));
                      })
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              UserList(userList, deleteUser)
            ],
          ),
        ),
      ),
    );
  }
}
