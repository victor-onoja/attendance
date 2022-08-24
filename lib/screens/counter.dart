import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:st8_management/controller/providers.dart';

class Counter extends ConsumerWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counter = ref.watch(counterProvider);

    ref.listen<int>(counterProvider, ((previous, next) {
      if (next >= 5) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Warning'),
                content: const Text(
                    'Counter dangerously high. Consider resetting it.'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'))
                ],
              );
            });
      }
    }));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        actions: [
          IconButton(
            onPressed: () {
              ref.refresh(counterProvider);
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Center(
        child: Text(
          counter.toString(),
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
      ),
    );
  }
}
