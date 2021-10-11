import 'dart:convert';
import 'package:radar_soft_tech/core/requests/requests.dart';
import 'package:radar_soft_tech/features/core/models/user.dart';

class UsersModel {
  static bool _showGrid = false;

  static bool get showGrid => _showGrid;

  static void setGrid(bool value) => _showGrid = value;

  /// I wanted to add a next and previous buttons
  /// since there are 2 pages but,
  /// I wasn't able to figure out a good way to implement it

  // static int _currentPage = 1;
  // static int get currentPage => _currentPage;

  static String? rawResponse;
  static List<User>? _users;

  static Future<List<User>?> get users async {
    rawResponse = await AppRequests.getUsers(1);

    if (rawResponse != null) {
      _users = List.from(
        json.decode(rawResponse!)['data'].map(
              (rawUser) => User.fromJson(rawUser: rawUser),
            ),
      );
    }
    
    return _users;
  }
}
