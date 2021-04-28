import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url, this.uri, this.query);
  final String url;
  final String uri;
  final Map<String, String> query;

  Future getData() async {
    http.Response response = await http.get(Uri.https(url, uri, query));

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
