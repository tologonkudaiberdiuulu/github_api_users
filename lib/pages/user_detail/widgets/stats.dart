import 'package:flutter/material.dart';
import 'package:github_api_users/models/User.dart';
import 'package:intl/intl.dart';

class Stats extends StatelessWidget {
  final User user;

  Stats(this.user);

  @override
  Widget build(BuildContext context) {
    final formatter = new DateFormat("dd/MM/yyyy");
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildButton(
          context: context,
          value: user.userFollowings.toString(),
          label: 'Following',
          onTap: () {},
        ),
        buildDivider(),
        buildButton(
          context: context,
          value: user.userFollowers.toString(),
          label: 'Followers',
          onTap: () {},
        ),
        buildDivider(),
        buildButton(
          context: context,
          value: user.createdAt != null
              ? formatter.format(DateTime.parse(user.createdAt!))
              : user.createdData,
          label: 'Created At',
          onTap: () {},
        ),
      ],
    );
  }

  Widget buildDivider() => Container(
        height: 28,
        child: VerticalDivider(
          thickness: 3,
          color: Colors.blue,
        ),
      );

  Widget buildButton({
    required BuildContext context,
    required String value,
    required String label,
    required VoidCallback onTap,
  }) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 8),
      onPressed: onTap,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
