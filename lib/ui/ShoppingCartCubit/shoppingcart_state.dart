part of 'shoppingcart_cubit.dart';

class ShoppingcartState extends Equatable {
  const ShoppingcartState({this.listProducts = const []});
  final List<CartProduct> listProducts;

  ShoppingcartState copyWith({List<CartProduct>? listProducts}) {
    return ShoppingcartState(listProducts: listProducts ?? this.listProducts);
  }

  @override
  List<Object> get props => [listProducts];


/*Este método calcula los impuestos de la compra, multiplicando el impusto * la canntidad 
de productos seleccionados, ademas de mantener el acumulado de los impuestos de todos los productos.
   @Params :  
   @Return : double*/
  double impuestoShoppingCart() {
    double impuestos = 0;
    if (listProducts.isNotEmpty) {
      for (CartProduct product in listProducts) {
        impuestos = impuestos + (product.product.montoIva * product.product.cantidad);
      }
    }
    return impuestos;
  }

/*Este método calcula el subtotal de la compra, multiplicando el precio sin iva * la canntidad 
de productos seleccionados, ademas de mantener el acumulado de todos los productos.
   @Params :  
   @Return : double*/
  double subtotalShoppingCart() {
    double subTotal = 0;
    if (listProducts.isNotEmpty) {
      for (CartProduct product in listProducts) {
        subTotal = subTotal + (product.product.precioSinIva * product.product.cantidad);
      }
    }
    return subTotal;
  }

/*Este método calcula el total de la compra, multiplicando el precio con el iva  * la canntidad 
de productos seleccionados, ademas de mantener el acumulado de todos los productos.
   @Params :  
   @Return : double*/
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
