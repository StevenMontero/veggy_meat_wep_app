import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggy/domain/models/cart_product.dart';
import 'package:veggy/theme/colors.dart';
import 'package:veggy/ui/ShoppingCartCubit/shoppingcart_cubit.dart';
import 'package:veggy/util/sizingInfo.dart';
import 'package:veggy/values/responsiveApp.dart';
import 'package:google_fonts/google_fonts.dart';

//Error de borde en tablet

class ShoppingCart extends StatelessWidget {
  const ShoppingCart() : super();

  @override
  Widget build(BuildContext context) {
    final themeText = Theme.of(context).textTheme;
    final responsiveApp = ResponsiveApp(context);

    return Scrollbar(
        child: Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
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
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SingleChildScrollView(
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
            width: 900,
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
                        padding: const EdgeInsets.only(left: 50),
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
                        padding: const EdgeInsets.only(left: 50),
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
                            '₡ ' + precioxUnidad.toString(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              color: Colors.black,
                            ),
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
            width: 450,
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
                          width: 40,
                          child: Text(
                            'X ' +
                                state.listProducts[index].product.cantidad.toString(),
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
                            '₡ ' + precioxUnidad.toString(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                              color: Colors.black,
                            ),
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
                    'Resumen',
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
                    'Items',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Text(
                    state.listProducts.length.toString(),
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
                    'Envio',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Text(
                    '1500',
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
                    '10 000',
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
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: ColorsApp.colorPaletteGreen,
                        padding: EdgeInsets.all(20)),
                    child: Text(
                      'Resumen',
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
