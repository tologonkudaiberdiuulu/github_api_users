import 'package:flutter/material.dart';
import 'package:github_api_users/pages/user_detail/widgets/stats.dart';
import 'package:github_api_users/pages/user_detail/widgets/user_profile.dart';
import 'package:github_api_users/providers/single_user_provider.dart';

import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  static String routeName = '/user_page';
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  Widget buildName(String userName, String userEmail) => Column(
        children: [
          Text(
            userName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            userEmail,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    final userName = ModalRoute.of(context)!.settings.arguments as String;
    return ChangeNotifierProvider(
      create: (ctx) => SingleUserProvider()..fetchUser(userName),
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Detail Page'),
        ),
        body: Consumer<SingleUserProvider>(
          builder: (context, provider, child) {
            if (provider.getErrorMessage().length != 0) {
              return Center(
                child: Text(provider.getErrorMessage()),
              );
            }

            if (provider.getLoading()) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            final user = provider.getUser();
            return SafeArea(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(height: 30),
                  UserPicture(imagePath: user.avatar),
                  const SizedBox(height: 24),
                  buildName(user.userName, user.userEmail),
                  const SizedBox(height: 24),
                  const SizedBox(height: 24),
                  Stats(user),
                  const SizedBox(height: 48),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
