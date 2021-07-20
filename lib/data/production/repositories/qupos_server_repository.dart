import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:veggy/domain/models/preorder.dart';

class QuposRepository {
  final dioClient = Dio();

  /*
   * Funciön encargada de enviar la preventa al sistema qupos
   * @Params : PreOrder preOrder
   * @Return : {
        'exito': bool,
        "numero_pedido": string,
        "mensajes": string,
      };
   */
  Future<Map<String, dynamic>> postPreventa(PreOrder preOrder) async {
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

      return {
        'exito': response.data['exito'],
        "numero_pedido": response.data["numero_pedido_generado"],
        "mensajes": response.data["mensajes"],
      };
    } on DioError catch (e) {
      return {
        'exito': false,
        "numero_pedido": '-1',
        "mensajes": e.message,
      };
    }
  }
}
