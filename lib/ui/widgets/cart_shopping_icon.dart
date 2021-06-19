import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggy/domain/models/product_api.dart';
import 'package:veggy/domain/models/product_detail.dart';
import 'package:veggy/router/navigation_key.dart';

import 'package:veggy/ui/ShoppingCartCubit/shoppingcart_cubit.dart';

class IconCartShoppingIndicator extends StatelessWidget {
  const IconCartShoppingIndicator() : super();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final a = ProductApi(code: '764009027291', itemGroup: 'ABARROTES',name: 'KELLOGGS cereales special k caja 500 gr',listPrice: 1500);
        final b = ProductDetail(product: a, sameListProduct: [a,a,a]);
        NavigationService.navigateToWithArguments(
            'detail/${a.itemGroup}/${a.code}', b);
      },
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
