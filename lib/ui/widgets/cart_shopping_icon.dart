import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggy/domain/models/cart_product.dart';
import 'package:veggy/domain/models/product.dart';
import 'package:veggy/ui/ShoppingCartCubit/shoppingcart_cubit.dart';

class IconCartShoppingIndicator extends StatelessWidget {
  const IconCartShoppingIndicator() : super();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<ShoppingcartCubit>().deleteProduct(
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
                  precioIva: 'precioIva',
                  porcentajeDescuento: 'porcentajeDescuento',
                  montoDescuento: 'montoDescuento',
                  bonificacion: 'bonificacion',
                  codImpuesto: 'codImpuesto'),
              quantity: 2,
              isGranel: false)),
      icon: Badge(
        position: BadgePosition.topEnd(top: -6, end: -3),
        animationDuration: Duration(milliseconds: 300),
        animationType: BadgeAnimationType.scale,
        badgeContent: BlocBuilder<ShoppingcartCubit, ShoppingcartState>(
          buildWhen: (previous, current) =>
              previous.listProducts != current.listProducts,
          builder: (context, state) {
            return Text(
              state.listProducts.length.toString(),
              style: TextStyle(color: Colors.white, fontSize: 12),
            );
          },
        ),
        child: Icon(
          Icons.shopping_cart,
          color: Colors.green,
        ),
      ),
    );
  }
}
