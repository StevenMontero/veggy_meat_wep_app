import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:veggy/domain/models/preorder.dart';

class QuposRepository {
  final dioClient = Dio();

  Future<Map<String, dynamic>?> postPreventa(PreOrder preOrder) async {
    print(jsonEncode(preOrder.toJson()));
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('PROYECTO:12345'));

    try {
      final response =
          await dioClient.post('http://186.177.135.3:45570/api/Preventas',
              data: jsonEncode(preOrder.toJson()),
              options: Options(headers: {
                'authorization': basicAuth,
                "Access-Control-Allow-Origin": "*",
                "Content-Type": "application/json",
                "Access-Control-Allow-Headers":
                    "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
                "Access-Control-Allow-Methods": "POST, OPTIONS",
                'Accept': "*/*",
              }));

      return response.data;
    } catch (e) {
      print('ERROR : response.statusCode \n${e.toString()}');
    }
  }
}
