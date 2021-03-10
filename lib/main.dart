import 'package:flutter/material.dart';
import 'package:ppt/ui/ppt.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: PptPage(),
    );
  }
}
