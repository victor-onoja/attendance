import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:st8_management/controller/main_list.dart';
import 'package:st8_management/controller/providers.dart';

class UserList extends HookConsumerWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainList = ref.watch(mainListProvider) as List;
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => Card(
        color: const Color(0xffBE5A38),
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
                    'Name: ${mainList[index].name}',
                    style:
                        const TextStyle(fontSize: 18, color: Color(0xffBDB4BF)),
                  ),
                  Text(
                    'City: ${mainList[index].city}',
                    style:
                        const TextStyle(fontSize: 18, color: Color(0xffBDB4BF)),
                  )
                ],
              ),
              IconButton(
                  onPressed: () {
                    UserListController controller =
                        ref.read(mainListProvider.notifier);
                    controller.deleteUser(mainList[index]);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
            ],
          ),
        ),
      ),
      itemCount: mainList.length,
    );
  }
}
