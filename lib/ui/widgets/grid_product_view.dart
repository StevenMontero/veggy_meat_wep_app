import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veggy/domain/models/product.dart';
import 'package:veggy/ui/widgets/product_card.dart';
import 'package:veggy/domain/models/product_api.dart';
import 'package:veggy/router/navigation_key.dart';
import 'package:veggy/domain/models/product_detail.dart';
import 'package:veggy/ui/ShoppingCartCubit/shoppingcart_cubit.dart';
import 'package:veggy/domain/models/cart_product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridProductWidget extends StatelessWidget {
  GridProductWidget({required this.listProduct, required this.controller}) : super();
  final List<ProductApi> listProduct;
  final ScrollController controller;

  List<ProductApi> loadList(ProductApi product, int index){
    int n = 0;
    int min = index;
    int max = index;
    List<ProductApi> listReturn = [];
    while(n<5){
      if (min == 0 && max==listProduct.length){
        break;
      }
      if ((min-1)>0){
        min --;
      }
      if ((max+1)<listProduct.length){
        max ++;
      }
      if (min>0 && listProduct[min].itemGroup==product.itemGroup){
        listReturn.add(listProduct[min]);
        n++;
      }
      if (max<listProduct.length && listProduct[max].itemGroup==product.itemGroup){
        listReturn.add(listProduct[max]);
        n++;
      }
    }
    return listReturn;
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controller,
      isAlwaysShown: true,
      child: GridView.builder(
        controller: controller,
          padding: EdgeInsets.symmetric(horizontal: 24),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 0.6,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1),

          itemCount: listProduct.length,
          itemBuilder: (BuildContext ctx, index) {
            return ProductCard(
                title: listProduct[index].name,
                price: listProduct[index].listPrice.toStringAsFixed(2),
                code: listProduct[index].code,
                category: listProduct[index].itemGroup,
                imageUrl: '',
                onPressCard: () {
                  var productDetail = ProductDetail(product: listProduct[index], sameListProduct: loadList(listProduct[index], index));
                  NavigationService.navigateToWithArguments('/detail/${"listProduct[index].itemGroup"}/${"listProduct[index].code"}', productDetail);
                },
                onPressButton: () {
                  final double montoIva =
                      listProduct[index].listPrice *
                          (listProduct[index].misc1 /
                              100);
                  final _product = Product(
                      codigoArticulo:
                      listProduct[index].code,
                      cantidad: 1,
                      notas: '',
                      envioParcial: '',
                      precioSinIva: listProduct[index].listPrice,
                      montoIva: montoIva,
                      porcentajeIva: listProduct[index].misc1.toDouble(),
                      codigoTarifa: '',
                      montoDescuento: 0,
                      precioIva: montoIva + listProduct[index].listPrice,
                      bonificacion: '',
                      porcentajeDescuento: 0,
                      codImpuesto: listProduct[index].misc3,
                  );
                  context.read<ShoppingcartCubit>().addProduct(
                      CartProduct(
                          product: _product,
                          isGranel: listProduct[index].itemGroup == 'GRANEL',
                          name: listProduct[index].name));
                });
          }),
    );
  }
}
