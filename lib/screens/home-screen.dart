import 'package:flutter/material.dart';
import 'package:st8_management/controller/main_list.dart';
import 'package:st8_management/controller/providers.dart';
import 'package:st8_management/model/user.dart';
import 'package:st8_management/screens/counter.dart';
import 'package:st8_management/screens/list_screen.dart';
import 'package:st8_management/widget/button.dart';
import 'package:st8_management/widget/input.dart';
import 'package:st8_management/widget/list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Page1 extends ConsumerStatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  ConsumerState<Page1> createState() => _Page1State();
}

class _Page1State extends ConsumerState<Page1> {
  final nameController = TextEditingController();
  final cityController = TextEditingController();

  onDispose() {
    nameController.clear();
    cityController.clear();
    super.dispose();
  }

  List<User> userList = [];

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff36382E),
      appBar: AppBar(
        backgroundColor: const Color(0xff92140C),
        title: Consumer(
          builder: (context, ref, child) {
            AsyncValue<String> name = ref.watch(profileNameProvider);
            return name.when(
                data: (name) => Text(
                      name,
                      style: const TextStyle(color: Color(0xffE6E49F)),
                    ),
                error: (e, stackTrace) => const Text('Error'),
                loading: () => const Text('loading...'));
          },
        ),
        leading: Center(
          child: Consumer(builder: (context, ref, _) {
            AsyncValue<String> time = ref.watch(sessionTimeProvider('sec'));
            return time.when(
                data: (time) => Text(
                      time,
                      style: const TextStyle(
                          fontSize: 14, color: Color(0xffE6E49F)),
                    ),
                error: (e, stackTrace) => const Text('error'),
                loading: () => const Text('?'));
          }),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                ref.read(titleProvider),
                style: const TextStyle(fontSize: 30, color: Color(0xffBDB4BF)),
              ),
              const SizedBox(height: 16),
              FormInput(
                labelText: 'Name',
                validator: (value) =>
                    value!.isEmpty ? 'please put in your details' : null,
                controller: nameController,
              ),
              const SizedBox(height: 16),
              FormInput(
                labelText: 'City',
                controller: cityController,
                validator: (value) =>
                    value!.isEmpty ? 'please put in your details' : null,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer(
                    builder: (context, ref, _) {
                      final UserListController controller =
                          ref.read(mainListProvider.notifier);
                      return Button(
                          text: 'Add',
                          onPressed: () {
                            final FormState? form = _formkey.currentState;
                            if (form!.validate()) {
                              controller.addUser(User(
                                  nameController.text, cityController.text));
                              nameController.clear();
                              cityController.clear();
                            }
                          });
                    },
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Button(
                      text: 'List',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ListScreen(),
                            ));
                      })
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Counter()));
                  },
                  child: const Text('Go to counter Page')),
              const UserList()
            ],
          ),
        ),
      ),
    );
  }
}
