import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  String url;
  NetworkHelper({this.url});

  Future<dynamic> get() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
