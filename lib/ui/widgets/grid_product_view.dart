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

/*
 * Clase tipo Widget que construye la lista de tarjetas de productos
 * a mostrar.
 * @Params : List<ProductApi> listProduct
 * Lista de productos a cargar en tarjetas de producto.
 * @Params : ScrollController controller
 * Controlador de lista desplegable del contenedor padre.
 */
class GridProductWidget extends StatelessWidget {
  GridProductWidget({required this.listProduct, required this.controller})
      : super();
  final List<ProductApi> listProduct;
  final ScrollController controller;

  /*
   * Función para cargado de lista de cinco productos similares al producto
   * a cargar en vista de detalles.
   * @Params ProductApi product
   * Producto del cual se desean obtener productos similares.
   * @Params int index
   * Índice del producto en la lista de de productos cargados.
   * @Return List<ProductApi>
   * Lista obtenida de productos similares.
   */
  List<ProductApi> loadList(ProductApi product, int index) {
    int n = 0;
    int min = index;
    int max = index;
    List<ProductApi> listReturn = [];
    int safe = 0;
    while (n < 5) {
      if (min == 0 && max == listProduct.length) {
        break;
      }
      if ((min - 1) >= 0) {
        min--;
      }
      if ((max + 1) <= listProduct.length) {
        max++;
      }
      if (min > 0 && listProduct[min].itemGroup == product.itemGroup) {
        listReturn.add(listProduct[min]);
        n++;
      }
      if (max < listProduct.length &&
          listProduct[max].itemGroup == product.itemGroup) {
        listReturn.add(listProduct[max]);
        n++;
      }
      safe++;
      if (safe > 20) {
        safe = 0;
        break;
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
            final price = listProduct[index].itemGroup == 'GRANEL'
                ? listProduct[index].listPrice / 1000
                : listProduct[index].listPrice;
            return ProductCard(
                title: listProduct[index].name,
                price: price.toStringAsFixed(2),
                code: listProduct[index].code,
                category: listProduct[index].itemGroup,
                imageUrl: '',
                unidad: listProduct[index].unidad,
                onPressCard: () {
                  var productDetail = ProductDetail(
                      product: listProduct[index],
                      sameListProduct: loadList(listProduct[index], index));
                  NavigationService.navigateToWithArguments(
                      '/detail/${"listProduct[index].itemGroup"}/${"listProduct[index].code"}',
                      productDetail);
                },
                onPressButton: () {
                  final double montoIva = price *
                      (listProduct[index].misc1 / 100);
                  final _product = Product(
                    codigoArticulo: listProduct[index].code,
                    cantidad: 1,
                    notas: '',
                    envioParcial: '',
                    precioSinIva: price,
                    montoIva: montoIva,
                    porcentajeIva: listProduct[index].misc1.toDouble(),
                    codigoTarifa: '',
                    montoDescuento: 0,
                    precioIva: montoIva + price,
                    bonificacion: '',
                    porcentajeDescuento: 0,
                    codImpuesto: listProduct[index].misc3,
                  );
                  context.read<ShoppingcartCubit>().addProduct(CartProduct(
                      product: _product,
                      isGranel: listProduct[index].itemGroup == 'GRANEL',
                      name: listProduct[index].name));
                });
          }),
    );
  }
}
