import 'package:flutter/widgets.dart';
import 'package:skype_clone/models/user.dart';
import 'package:skype_clone/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  Person _user;
  AuthMethods _authMethods = AuthMethods();

  Person get getUser => _user;

  Future<void> refreshUser() async {
    Person user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
