import 'package:flutter/material.dart';
import 'package:veggy/domain/models/product_detail.dart';
import 'package:veggy/router/navigation_key.dart';
import 'package:veggy/util/sizingInfo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggy/domain/models/product.dart';
import 'package:veggy/ui/widgets/product_card.dart';
import 'package:veggy/domain/models/cart_product.dart';
import 'package:veggy/ui/ShoppingCartCubit/shoppingcart_cubit.dart';
import 'package:veggy/ui/pages/homepage/cubits/newProductsCubit/new_products_cubit.dart';
//**Esta clase lee desde el state la lista de productos nuevos
//y los muestra en el home en una tarjeta con su respectiva informacion*/
class NewProductsView extends StatelessWidget {
  const NewProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Body();
  }
}

class _Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Titulo de la seccion de los productos mas nuevos
          Padding(
            padding: EdgeInsets.only(
                top: 24, bottom: 14, left: isMobile(context) ? 20 : 0),
            child: Text(
              'Lo más nuevo',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
                right: isMobile(context) ? 20 : 0,
                left: isMobile(context) ? 20 : 0),
            width: isMobile(context)
                ? double.infinity
                : isTablet(context)
                    ? 600
                    : 1000,
            height: 350,
            child: BlocBuilder<NewProductsCubit, NewProductState>(
              buildWhen: (previous, current) =>
                  previous.listNewProducts != current.listNewProducts,
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.listNewProducts.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ProductCard(
                        title: state.listNewProducts[index].name,
                        price:
                            state.listNewProducts[index].listPrice.toString(),
                        code: state.listNewProducts[index].code,
                        category: state.listNewProducts[index].itemGroup,
                        imageUrl: '',
                        onPressCard: () {
                          NavigationService.navigateToWithArguments(
                          'detail/${state.listNewProducts[index].itemGroup}/${state.listNewProducts[index].code}',
                           ProductDetail(product: state.listNewProducts[index], sameListProduct: []));
                        },
                        onPressButton: () {
                          final _product = Product(
                              codigoArticulo: state.listNewProducts[index].code,
                              cantidad: 1,
                              notas: '',
                              envioParcial: '',
                              precioSinIva: 0,
                              montoIva: 0,
                              porcentajeIva: 0,
                              codigoTarifa: 'codigoTarifa',
                              precioIva: 0,
                              porcentajeDescuento: 0,
                              montoDescuento: 0,
                              bonificacion: 'bonificacion',
                              codImpuesto: state.listNewProducts[index].misc3);
                          context.read<ShoppingcartCubit>().addProduct(
                              CartProduct(
                                  product: _product,
                                  isGranel:
                                      state.listNewProducts[index].itemGroup == 'GRANEL',
                                  name: state.listNewProducts[index].name + '2'));
                        });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
