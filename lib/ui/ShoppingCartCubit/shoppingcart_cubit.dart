import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:veggy/domain/models/cart_product.dart';
import 'package:veggy/domain/models/product.dart';

part 'shoppingcart_state.dart';

class ShoppingcartCubit extends Cubit<ShoppingcartState> {
  static final mockList = <CartProduct>[
    CartProduct(
        product: Product(
            codigoArticulo: '1111',
            cantidad: '10',
            notas: 'hola',
            envioParcial: '',
            precioSinIva: 'precioSinIva',
            montoIva: 'montoIva',
            porcentajeIva: 'porcentajeIva',
            codigoTarifa: 'codigoTarifa',
            precioIva: '1000',
            porcentajeDescuento: 'porcentajeDescuento',
            montoDescuento: 'montoDescuento',
            bonificacion: 'bonificacion',
            codImpuesto: 'codImpuesto'),
        name: 'Cereal',
        isGranel: false),
    CartProduct(
        product: Product(
            codigoArticulo: '2222',
            cantidad: '5',
            notas: 'hola',
            envioParcial: '',
            precioSinIva: 'precioSinIva',
            montoIva: 'montoIva',
            porcentajeIva: 'porcentajeIva',
            codigoTarifa: 'codigoTarifa',
            precioIva: '800',
            porcentajeDescuento: 'porcentajeDescuento',
            montoDescuento: 'montoDescuento',
            bonificacion: 'bonificacion',
            codImpuesto: 'codImpuesto'),
        name: 'Caja de leche',
        isGranel: false)
  ];
  ShoppingcartCubit() : super(ShoppingcartState(listProducts: mockList));

  void addProduct(CartProduct cartProduct) {
    final List<CartProduct> auxList = List.from(state.listProducts)
      ..add(cartProduct);
    emit(state.copyWith(listProducts: auxList));
  }

  void deleteProduct(CartProduct cartProduct) {
    final List<CartProduct> auxList = List.from(state.listProducts)
      ..removeWhere((element) =>
          element.product.codigoArticulo == cartProduct.product.codigoArticulo);
    emit(state.copyWith(listProducts: auxList));
  }
}
