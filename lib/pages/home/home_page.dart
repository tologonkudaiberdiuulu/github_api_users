import 'package:flutter/material.dart';
import 'package:github_api_users/models/User.dart';
import 'package:github_api_users/pages/home/widgets/user_item.dart';
import 'package:github_api_users/pages/home/widgets/users_list.dart';
import 'package:github_api_users/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home_page';
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => UserProvider()..getAllUsers(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("All Users"),
        ),
        body: Consumer<UserProvider>(
          builder: (context, provider, _) {
            if (provider.errorMessage.length != 0) {
              return SafeArea(
                child: Center(
                  child: Text(provider.errorMessage),
                ),
              );
            }
            if (provider.loading) {
              return SafeArea(
                  child: Center(child: CircularProgressIndicator()));
            }

            return SafeArea(
              child: UsersList(userProvider: provider),
            );
          },
        ),
      ),
    );
  }
}
