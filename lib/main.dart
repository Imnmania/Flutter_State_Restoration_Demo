import 'package:flutter/material.dart';
import 'package:state_restoration_demo/first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter State Restoration',
      restorationScopeId: "com.niloy.root",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const FirstPage(),
    );
  }
}
