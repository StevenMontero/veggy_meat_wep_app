

import 'package:dio/dio.dart';
import 'package:veggy/domain/models/preorder.dart';


class QuposRepository {
  final dioClient = Dio();

  void  postPreventa(PreOrder preOrder) async {
    // final response = await dioClient.get('201.207.180.249:45570/api/Articulos');
    final response = await dioClient.post('http://186.177.135.3:45570/api/Preventas', data: preOrder.toJson());
    if (response.statusCode == 200) {
     print('ok se envio bien');
    }
    
  }
}
