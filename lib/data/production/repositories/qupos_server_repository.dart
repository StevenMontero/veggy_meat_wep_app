import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:veggy/domain/models/preorder.dart';

class QuposRepository {
  final dioClient = Dio();

  void postPreventa(PreOrder preOrder) async {
    print(jsonEncode(preOrder.toJson()));

    final a = {
      'statusCode': 200,
      'headers': {
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        "Access-Control-Allow-Credentials":
            true, // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers":
            "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "POST, OPTIONS"
      },
      'body': jsonEncode(preOrder.toJson())
    };
    // final response = await dioClient.get('201.207.180.249:45570/api/Articulos');
    // final response =
    //     await dioClient.post('http://186.177.135.3:45570/api/Preventas',
    //         options: Options(
    //           headers: {
    //             "Access-Control-Allow-Origin":
    //                 "*", // Required for CORS support to work
    //             // Required for cookies, authorization headers with HTTPS

    //             "Access-Control-Allow-Methods": "POST, OPTIONS"
    //           },
    //         ),
    //         data: jsonEncode(preOrder.toJson()));

    final response =
        await http.post(Uri.parse('http://186.177.135.3:45570/api/Preventas'),
            headers: {
              "Content-Type": "application/x-www-form-urlencoded"
            },
            body: jsonEncode(preOrder.toJson()));
    if (response.statusCode == 200) {
      print(response.body);
      print('ok se envio bien');
    }
  }
}
