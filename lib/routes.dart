import 'package:flutter/material.dart';
import 'package:github_api_users/pages/home/home_page.dart';
import 'package:github_api_users/pages/user_detail/user_page.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => HomePage(),
  UserPage.routeName: (context) => UserPage(),
};
