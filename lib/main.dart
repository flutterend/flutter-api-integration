import 'package:flutter/material.dart';
import 'package:flutter_api/controller/routes.dart';
import 'package:flutter_api/model/theme.dart';
import 'package:flutter_api/view/categories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter json api integration",
      theme: appTheme(),
      darkTheme: appDarkTheme(),
      themeMode: ThemeMode.system,
      initialRoute: Categories.route,
      routes: customRoutes,
    );
  }
}
