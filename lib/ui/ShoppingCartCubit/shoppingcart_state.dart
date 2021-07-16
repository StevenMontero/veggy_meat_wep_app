part of 'shoppingcart_cubit.dart';

class ShoppingcartState extends Equatable {
  const ShoppingcartState({this.listProducts = const []});
  final List<CartProduct> listProducts;

  ShoppingcartState copyWith({List<CartProduct>? listProducts}) {
    return ShoppingcartState(listProducts: listProducts ?? this.listProducts);
  }

  @override
  List<Object> get props => [listProducts];

  double impuestoShoppingCart() {
    double impuestos = 0;
    if (listProducts.isNotEmpty) {
      for (CartProduct product in listProducts) {
        impuestos = impuestos + (product.product.montoIva * product.product.cantidad);
      }
    }
    return impuestos;
  }

  double subtotalShoppingCart() {
    double subTotal = 0;
    if (listProducts.isNotEmpty) {
      for (CartProduct product in listProducts) {
        subTotal = subTotal + (product.product.precioSinIva * product.product.cantidad);
      }
    }
    return subTotal;
  }

  double totalShoppingCart() {
    double total = 0;
    if (listProducts.isNotEmpty) {
      for (CartProduct product in listProducts) {
        total = total + (product.product.precioIva * product.product.cantidad);
      }
    }
    return total;
  }
}
