import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:st8_management/controller/providers.dart';
import 'package:st8_management/widget/list.dart';

class ListScreen extends HookConsumerWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(countryProvider);
    return Scaffold(
      backgroundColor: const Color(0xff36382E),
      appBar: AppBar(
        title: provider.when(
            data: (country) => Text(
                  country,
                  style: const TextStyle(color: Color(0xffE6E49F)),
                ),
            loading: () => const Text('Loading...',
                style: TextStyle(color: Color(0xffE6E49F))),
            error: (e, stackTrace) => const Text(
                  'error',
                  style: TextStyle(color: Colors.red),
                )),
        backgroundColor: const Color(0xff92140C),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8),
        child: UserList(),
      ),
    );
  }
}
