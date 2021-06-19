import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:veggy/domain/models/product_detail.dart';

class LocalBD {
  void saveProductDetailState(ProductDetail product) async {
    final prefs = await SharedPreferences.getInstance();
    final encodeMap = jsonEncode(product.toJson());
    prefs.setString(
      'stateProductDetail',
      encodeMap,
    );
  }

  Future<ProductDetail?> getProductDetailState() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('stateProductDetail');

    if (data != null) {
      return ProductDetail.fromJson(jsonDecode(data));
    }
    return null;
  }
}
