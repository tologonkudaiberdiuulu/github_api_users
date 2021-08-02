import 'package:flutter/material.dart';
import 'package:github_api_users/models/User.dart';
import 'package:github_api_users/pages/user_detail/user_page.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(UserPage.routeName, arguments: user.login);
      },
      child: SizedBox(
        width: double.infinity,
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user.avatar),
          ),
          title: Text(
            user.login,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(user.id.toString()),
        ),
      ),
    );
  }
}
