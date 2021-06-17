import 'package:veggy/domain/models/product.dart';

class CartProduct {
  Product product;
  int quantity;
  bool isGranel;
  CartProduct({
    required this.product,
    required this.quantity,
    required this.isGranel,
  });
}
