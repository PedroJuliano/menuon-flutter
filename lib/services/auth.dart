import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Authentication {
  Future<Map<String, dynamic>> login(String email, String password) async {
    var url = Uri.parse('https://menuon-api.herokuapp.com/login');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {'email': email, 'password': password},
    );
    if (response.statusCode == 200) {
      var jsonResponse = await convert.jsonDecode(response.body);
      return jsonResponse;
    } else {
      return {"statusCode": response.statusCode};
      // throw Exception('Error status code: ${response.statusCode}');
    }
  }
}
