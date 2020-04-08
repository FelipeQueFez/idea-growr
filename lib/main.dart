import 'package:flutter/material.dart';
import 'package:idea_growr/modules/database/providers/database_provider.dart';
import 'package:idea_growr/setup.dart';
import 'package:idea_growr/theme.dart';
import 'package:idea_growr/views/screens/home/home.dart';

void main() async {
  await setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  StatelessElement createElement() {
    //TODO:test
    DatabaseProvider service = new DatabaseProvider();
    service.openDatabaseAsync();
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Idea Growr',
        debugShowCheckedModeBanner: false,
        theme: getTheme(context),
        home: Home());
  }
}
