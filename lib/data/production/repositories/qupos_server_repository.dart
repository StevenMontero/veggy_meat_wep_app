import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:veggy/domain/models/preorder.dart';

class QuposRepository {


  void postPreventa(PreOrder preOrder) async {
    print(jsonEncode(preOrder.toJson()));
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('pruebas:123456'));
    final response =
        await http.post(Uri.parse('http://186.177.135.3:45570/api/Preventas'),
            headers: {
              'authorization': basicAuth,
              "Access-Control-Allow-Origin": "*",
              "Content-Type": "application/x-www-form-urlencoded"
            },
            body: jsonEncode(preOrder.toJson()));
    if (response.statusCode == 200) {
      print(response.body);
      print('ok se envio bien');
    }
  }
}
