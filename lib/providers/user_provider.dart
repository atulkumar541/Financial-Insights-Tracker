import 'package:flutter/foundation.dart';
import '../models/index.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;
  String? _error;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isLoggedIn => _user != null;

  Future<void> loadUser(String userId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // TODO: Fetch user from database
      // _user = await userService.getUser(userId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateUser(UserModel user) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // TODO: Update user in database
      // await userService.updateUser(user);
      _user = user;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  void logout() {
    _user = null;
    _error = null;
    _isLoading = false;
    notifyListeners();
  }
}
