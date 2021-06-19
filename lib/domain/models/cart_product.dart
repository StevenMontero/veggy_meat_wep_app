import 'package:veggy/domain/models/product.dart';

class CartProduct {
  Product product;
  bool isGranel;
  String name;
  CartProduct({
    required this.product,
    required this.isGranel,
    required this.name,
  });
}
