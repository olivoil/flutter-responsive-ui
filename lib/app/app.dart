import 'package:flutter/material.dart';
import 'package:recruiting/app/routes.dart';
import 'package:recruiting/app/theme.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "recruiting",
      debugShowCheckedModeBanner: false,
      theme: theme,
      onGenerateRoute: Routes().router.generator,
    );
  }
}
