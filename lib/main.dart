import 'package:flutter/material.dart';
import 'package:idea_growr/setup.dart';
import 'package:idea_growr/theme.dart';
import 'package:idea_growr/views/screens/home/home.dart';

void main() async {
  await setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Idea Growr Clone',
        debugShowCheckedModeBanner: false,
        theme: getTheme(context),
        home: Home());
  }
}
