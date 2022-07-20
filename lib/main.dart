import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http_riverpod/features/bottom/bottom_view.dart';
import 'package:http_riverpod/features/setting/setting_singleton.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(settingProvider);
    return MaterialApp(
      title: 'Counter Riverpod',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeData ? ThemeMode.dark : ThemeMode.light,
      home: const BottomView(),
    );
  }
}
