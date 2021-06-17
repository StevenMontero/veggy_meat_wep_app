part of 'shoppingcart_cubit.dart';

class ShoppingcartState extends Equatable {
  const ShoppingcartState({this.listProducts = const []});
  final List<CartProduct> listProducts;

  ShoppingcartState copyWith({List<CartProduct>? listProducts}) {
    return ShoppingcartState(listProducts: listProducts ?? this.listProducts);
  }

  @override
  List<Object> get props => [listProducts];
}
