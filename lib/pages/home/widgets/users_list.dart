import 'package:flutter/material.dart';
import 'package:github_api_users/models/User.dart';
import 'package:github_api_users/pages/home/widgets/user_item.dart';
import 'package:github_api_users/providers/user_provider.dart';

class UsersList extends StatefulWidget {
  const UsersList({
    Key? key,
    required this.userProvider,
  }) : super(key: key);

  final UserProvider userProvider;

  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(scrollListener);
    widget.userProvider.getAllUsers();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      if (widget.userProvider.hasNext) {
        widget.userProvider.getAllUsers();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<User> users = widget.userProvider.users;
    return RefreshIndicator(
      onRefresh: () {
        widget.userProvider.reset();
        return widget.userProvider.getAllUsers();
      },
      child: ListView(
        controller: scrollController,
        padding: EdgeInsets.all(12),
        children: [
          ...widget.userProvider.users
              .map((user) => UserItem(user: user))
              .toList(),
          if (widget.userProvider.nextLoading)
            Center(
              child: GestureDetector(
                onTap: widget.userProvider.getAllUsers,
                child: Container(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
