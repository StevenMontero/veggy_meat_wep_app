import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:veggy/domain/models/preorder.dart';

class QuposRepository {
  final dioClient = Dio();
  void postPreventa(PreOrder preOrder) async {
    print(jsonEncode(preOrder.toJson()));
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('pruebas:123456'));
    final response = await dioClient.post(
        'http://186.177.135.3:45570/api/Preventas',
        data: jsonEncode(preOrder.toJson()),
        options: Options(headers: {
          'authorization': basicAuth,
          "Access-Control-Allow-Origin": "*",
          "Content-Type": "application/x-www-form-urlencoded"
        }));

    if (response.statusCode == 200) {
      print(response.data);
      print('ok se envio bien');
    }
    print('///////////Final responce////////////////');
    print(response.data);
  }
}
