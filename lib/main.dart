import 'package:flutter/material.dart';
import 'package:idea_growr/theme.dart';
import 'package:idea_growr/views/screens/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Idea Growr',
        debugShowCheckedModeBanner: false,
        theme: getTheme(context),
        home: Home());
  }
}
