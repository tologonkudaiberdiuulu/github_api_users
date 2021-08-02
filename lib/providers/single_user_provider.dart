import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:github_api_users/models/User.dart';
import 'package:github_api_users/requests/github_request.dart';

class SingleUserProvider extends ChangeNotifier {
  User? _user;
  String? _errorMessage;
  bool _loading = false;

  void fetchUser(String userName) async {
    setLoading(true);
    await GithubApiUsers().fetchSingleUser(userName).then((response) {
      if (response.statusCode == 200) {
        setUser(User.fromJson(json.decode(response.body)));
      } else {
        Map<String, dynamic> result = json.decode(response.body);
        setErrorMessage(result['message']);
      }
    });
    setLoading(false);
  }

  void setUser(val) {
    _user = val;
    notifyListeners();
  }

  User getUser() {
    return _user ?? User.emptyUser;
  }

  void setLoading(val) {
    _loading = val;
    notifyListeners();
  }

  bool getLoading() {
    return _loading;
  }

  void setErrorMessage(val) {
    _errorMessage = val;
    notifyListeners();
  }

  String getErrorMessage() {
    return _errorMessage ?? '';
  }
}
