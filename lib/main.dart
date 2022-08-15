import 'package:flutter/material.dart';
import 'package:st8_management/screens/home-screen.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final helloWorldProvider = Provider((_) => 'Hello World');

// void main() {
//   runApp(ProviderScope(child: MyApp()));
// }

// class MyApp extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final String value = ref.watch(helloWorldProvider);
//     return MaterialApp(home: Page1()
//         // Scaffold(
//         //   appBar: AppBar(
//         //     title: const Text('State Management: Riverpod'),
//         //   ),
//         //   body: Center(
//         //         child: Text(value)),
//         //   ),
//         // ),
//         );
//   }
// }
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page1(),
    );
  }
}
