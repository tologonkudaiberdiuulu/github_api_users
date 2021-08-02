import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:github_api_users/models/User.dart';
import 'package:github_api_users/requests/github_request.dart';

class UserProvider extends ChangeNotifier {
  List<User> _usersList = [];
  String? _errorMessage;
  bool _loading = true;
  bool _isNextLoading = true;
  bool _hasNext = true;
  int _startId = 0;
  int _perPage = 20;

  Future<void> getAllUsers() async {
    await GithubApiUsers()
        .fetchAllUsers(startId: _startId, perPage: _perPage)
        .then((response) {
      // print(response.body);
      if (response.statusCode == 200) {
        var users = json.decode(response.body);
        // print(users);
        for (int i = 0; i < users.length; i++) {
          var userT = User.fromJson(users[i]);
          // print(userT.toJson());
          addUser(userT);
        }
        if (users.length < _perPage) {
          _hasNext = false;
        } else {
          _hasNext = true;
        }
        _startId = _usersList[_usersList.length - 1].id;
        usersReady();
      } else {
        Map<String, dynamic> result = json.decode(response.body);
        setErrorMessage(result['message']);
        print('Error');
      }
    });
    if (_loading) setLoading(false);
    if (_isNextLoading) setNextLoading(false);
  }

  void addUser(val) {
    _usersList.add(val);
  }

  void usersReady() {
    notifyListeners();
  }

  clearUsersList() {
    _usersList.clear();
  }

  List<User> get users {
    return [..._usersList];
  }

  void setLoading(val) {
    _loading = val;
    notifyListeners();
  }

  void setNextLoading(val) {
    _isNextLoading = val;
    notifyListeners();
  }

  bool get loading {
    return _loading;
  }

  bool get nextLoading {
    return _isNextLoading;
  }

  bool get hasNext {
    return _hasNext;
  }

  void setErrorMessage(val) {
    _errorMessage = val;
    notifyListeners();
  }

  String get errorMessage {
    return _errorMessage ?? '';
  }

  void reset() {
    _errorMessage = null;
    _loading = true;
    _isNextLoading = true;
    _hasNext = true;
    _startId = 0;
    clearUsersList();
  }
}
