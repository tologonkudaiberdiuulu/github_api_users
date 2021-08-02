import 'package:flutter/material.dart';
import 'package:github_api_users/pages/home/home_page.dart';
import 'package:github_api_users/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: routes,
    );
  }
}
