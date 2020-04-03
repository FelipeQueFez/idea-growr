import 'package:flutter/material.dart';
import 'package:idea_growr/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;
  final AppBar appBar;
  final Widget bottomNavigationBar;

  const CustomScaffold({Key key, @required this.child, @required this.appBar, this.bottomNavigationBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBase,
      appBar: appBar,
      body: child,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
