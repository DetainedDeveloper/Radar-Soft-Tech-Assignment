import 'package:flutter/foundation.dart';
import 'package:radar_soft_tech/features/core/models/user.dart';
import 'package:radar_soft_tech/features/users/model/users_model.dart';

class UsersController extends ChangeNotifier {
  bool get showGrid => UsersModel.showGrid;
  
  void setGrid(bool value) {
    UsersModel.setGrid(value);
    notifyListeners();
  }

  Future<List<User>?> get users => UsersModel.users;
}
