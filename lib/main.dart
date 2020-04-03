import 'package:flutter/material.dart';
import 'package:idea_growr/app_colors.dart';
import 'package:idea_growr/views/screens/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Idea Growr',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.theme,
      ),
      home: Home()
    );
  }
}
