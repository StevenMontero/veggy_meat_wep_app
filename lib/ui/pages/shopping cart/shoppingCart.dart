import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggy/router/navigation_key.dart';
import 'package:veggy/router/routes.dart';
import 'package:veggy/theme/colors.dart';
import 'package:veggy/ui/ShoppingCartCubit/shoppingcart_cubit.dart';
import 'package:veggy/util/sizingInfo.dart';
import 'package:veggy/values/responsiveApp.dart';
import 'package:google_fonts/google_fonts.dart';

//Error de borde en tablet

class ShoppingCart extends StatelessWidget {
  ShoppingCart() : super();
  final _scrollController = ScrollController();
  final _scrollController2 = ScrollController();
  final _scrollController3 = ScrollController();

  @override
  Widget build(BuildContext context) {
    final themeText = Theme.of(context).textTheme;
    final responsiveApp = ResponsiveApp(context);
    return Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController3,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              controller: _scrollController3,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Material(
                          color: Colors.white,
                          child: Text(
                            'Carrito de compras',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Scrollbar(
                          isAlwaysShown: true,
                          controller: _scrollController,
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            scrollDirection: Axis.horizontal,
                            child: Scrollbar(
                              isAlwaysShown: true,
                              controller: _scrollController2,
                              child: SingleChildScrollView(
                                controller: _scrollController2,
                                scrollDirection: Axis.vertical,
                                child: isMobileAndTablet(context)
                                    ? listProductMovil(
                                        themeText,
                                        responsiveApp,
                                        context,
                                      )
                                    : listProduct(
                                        themeText,
                                        responsiveApp,
                                        context,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: resume(themeText, responsiveApp, context),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

//list.count
//recibir lista por parametro
//hasta .lenth
  Widget listProduct(
      TextTheme themeText, ResponsiveApp responsiveApp, BuildContext context) {
    return Material(
      child: BlocBuilder<ShoppingcartCubit, ShoppingcartState>(
        builder: (context, state) {
          var sizeHeight = (150 * state.listProducts.length).toDouble();
          if (sizeHeight >= 700) {
            sizeHeight = 700;
          }
          return Container(
            height: sizeHeight,
            width: 1000,
            color: Colors.white,
            child: ListView.builder(
              itemCount: state.listProducts.length,
              itemBuilder: (context, index) {
                var precioxUnidad =
                    state.listProducts[index].product.precioIva *
                        state.listProducts[index].product.cantidad;
                return Container(
                  height: 150,
                  width: 800,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          top: BorderSide(
                              color: Colors.grey.shade400, width: 0.5))),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Image.network(
                            'https://s2.dia.es/medias/hb7/hc3/10643207847966.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Container(
                          color: Colors.white,
                          height: 60,
                          width: 250,
                          child: Text(
                            state.listProducts[index].name,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Container(
                          color: Colors.white,
                          height: 50,
                          width: 150,
                          child: Text(
                            '₡ ' +
                                state.listProducts[index].product.precioIva
                                    .toStringAsFixed(2),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Container(
                          color: Colors.white,
                          height: 50,
                          width: 50,
                          child: Text(
                            'X ' +
                                state.listProducts[index].product.cantidad
                                    .toString(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Container(
                          color: Colors.white,
                          height: 50,
                          width: 150,
                          child: Text(
                            '₡ ' + precioxUnidad.toStringAsFixed(2),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          height: 50,
                          width: 50,
                          alignment: Alignment.center,
                          child: IconButton(
                            icon: Icon(Icons.delete, size: 40),
                            color: Colors.red,
                            onPressed: () {
                              context
                                  .read<ShoppingcartCubit>()
                                  .deleteProduct(state.listProducts[index]);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget listProductMovil(
      TextTheme themeText, ResponsiveApp responsiveApp, BuildContext context) {
    return BlocBuilder<ShoppingcartCubit, ShoppingcartState>(
      builder: (context, state) {
        var sizeHeight = (150 * state.listProducts.length).toDouble();
        if (sizeHeight >= 650) {
          sizeHeight = 650;
        }
        return Material(
          child: Container(
            height: sizeHeight,
            width: 500,
            child: ListView.builder(
              itemCount: state.listProducts.length,
              itemBuilder: (context, index) {
                var precioxUnidad =
                    state.listProducts[index].product.precioIva *
                        state.listProducts[index].product.cantidad;
                return Container(
                  height: 150,
                  width: 450,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          top: BorderSide(
                              color: Colors.grey.shade400, width: 0.5))),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Image.network(
                            'https://s2.dia.es/medias/hb7/hc3/10643207847966.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          color: Colors.white,
                          height: 50,
                          width: 130,
                          child: Text(
                            state.listProducts[index].name,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          color: Colors.white,
                          height: 40,
                          width: 100,
                          child: Text(
                            '₡ ' +
                                state.listProducts[index].product.precioIva
                                    .toStringAsFixed(2),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          color: Colors.white,
                          height: 40,
                          width: 40,
                          child: Text(
                            'X ' +
                                state.listProducts[index].product.cantidad
                                    .toString(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          color: Colors.white,
                          height: 40,
                          width: 100,
                          child: Text(
                            '₡ ' + precioxUnidad.toStringAsFixed(2),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          child: IconButton(
                            icon: Icon(Icons.delete),
                            color: Colors.red,
                            onPressed: () {
                              context
                                  .read<ShoppingcartCubit>()
                                  .deleteProduct(state.listProducts[index]);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget resume(
      TextTheme themeText, ResponsiveApp responsiveApp, BuildContext context) {
    return BlocBuilder<ShoppingcartCubit, ShoppingcartState>(
      builder: (context, state) {
        return Container(
            height: 300,
            width: 300,
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: ColorsApp.colorPaletteorange),
            child: ListView(children: [
              Card(
                color: ColorsApp.colorPaletteorange,
                elevation: 0,
                child: ListTile(
                  title: Text(
                    'Detalle de compra',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Card(
                color: ColorsApp.colorPaletteorange,
                elevation: 0,
                child: ListTile(
                  title: Text(
                    'Impuestos',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Text(
                    state.impuestoShoppingCart().toStringAsFixed(2),
                    textAlign: TextAlign.right,
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Card(
                color: ColorsApp.colorPaletteorange,
                elevation: 0,
                child: ListTile(
                  title: Text(
                    'SubTotal',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Text(
                    state.subtotalShoppingCart().toStringAsFixed(2),
                    textAlign: TextAlign.right,
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Card(
                color: ColorsApp.colorPaletteorange,
                elevation: 0,
                child: ListTile(
                  title: Text(
                    'Total',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Text(
                    state.subtotalShoppingCart().toStringAsFixed(2),
                    textAlign: TextAlign.right,
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                    onPressed: () {
                      NavigationService.navigateTo(
                          Flurorouter.formPreOrderRoute);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: ColorsApp.colorPaletteGreen,
                        padding: EdgeInsets.all(20)),
                    child: Text(
                      'Finalizar compra',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.25),
                    )),
              )
            ]));
      },
    );
  }
}
