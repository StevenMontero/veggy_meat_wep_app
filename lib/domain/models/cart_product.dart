import 'package:veggy/domain/models/product.dart';

class CartProduct {
  late Product product;
  late bool isGranel;
  late String name;
  CartProduct({
    required this.product,
    required this.isGranel,
    required this.name,
  });
  CartProduct.fromJson(Map<String, dynamic> json) {
    this.product = Product.fromJson(json['product']);
    this.isGranel = json['isGranel'];
    this.name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'product': this.product.toJson(),
      'name': this.name,
      'isGranel': this.isGranel,
    };
  }
}
