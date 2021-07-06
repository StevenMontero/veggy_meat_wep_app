import 'package:flutter/material.dart';
import 'package:veggy/util/sizingInfo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggy/ui/widgets/carousel.dart';
import 'package:veggy/ui/widgets/bottomBar.dart';
import 'package:veggy/values/responsiveApp.dart';
import 'package:veggy/domain/models/newProduts.dart';
import 'package:veggy/domain/models/product_api.dart';
import 'package:veggy/ui/pages/homepage/widgets/showImage.dart';
import 'package:veggy/ui/pages/homepage/widgets/newProductsView.dart';
import 'package:veggy/ui/pages/homepage/widgets/listCategoryView.dart';
import 'package:veggy/ui/pages/homepage/cubits/newProductsCubit/new_products_cubit.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ResponsiveApp? responsiveApp;
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewProductsCubit()..loadNewProducts(_loadProductsTest()),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        /*drawer: ,*/
        body: ListView(
          children: [
            Carousel(),
            ListCategoryView(),
            ShowImage(),
            NewProductsView(),
            SizedBox(height: 20,),
            isDesktop(context)? BottomBar(): Container(),
          ],
        ),
      ),
    );
  }
//------Carga algunos produtos para prueba local-----------
  NewProducts _loadProductsTest(){
    final newProduct1 = ProductApi(
      code: '764009027291',
      itemGroup: 'ABARROTES',
      name: 'KELLOGGS cereales special k caja 500 gr',
      listPrice: 1500,);
    final newProduct2 = ProductApi(
      code: '7441002440082',
      itemGroup: 'ABARROTES',
      name: 'RICHLY GARBANZOS 425G',
      listPrice: 620,);
      final newProduct3 = ProductApi(
      code: '000039',
      itemGroup: 'CARNE DE RES',
      name: 'POSTA DE CERDO  MOLIDA  KG',
      listPrice: 3170,);
      final newProduct4 = ProductApi(
      code: '7443033270065',
      itemGroup: 'LACTEOS',
      name: 'HELADO KETO LIME BUTTER PECAN 70G',
      listPrice: 2635,);
    final newProducts = NewProducts(listNewProducts: 
    [newProduct1, newProduct2, newProduct3, newProduct4]);
    return newProducts;
  }
//--------------------------------------------------------------
}
