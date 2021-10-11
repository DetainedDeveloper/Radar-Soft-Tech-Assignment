import 'package:http/http.dart' as http;

abstract class AppRequests {
  static final http.Client _client = http.Client();
  
  static Future<String?> getUsers(int page) async {
    final http.Response response = await _client.get(
      Uri.parse('https://reqres.in/api/users?page=$page'),
    );

    if (response.statusCode == 200) {
      return response.body;
    }
  }
}
