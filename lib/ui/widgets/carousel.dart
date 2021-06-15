import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_state.dart';
import 'package:flutter/material.dart';
import 'package:veggy/domain/models/carouselModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggy/data/production/repositories/banner_repository.dart';
import 'package:veggy/ui/pages/homepage/cubits/carousel_cubit.dart';
import 'package:veggy/util/sizingInfo.dart';
import 'package:veggy/values/responsiveApp.dart';

class Carousel extends StatefulWidget {
  final BuildContext buildContext;
  Carousel(this.buildContext);
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  final CarouselController _controller = CarouselController();
  
  //int _current = 0;
//
  ////----------------Prueba----------------
  //List<String> carouselImages = [
  //  'assets/images/entregas a domicilio.png',
  //  'assets/images/miércoles de feria copia.png',
  //  'assets/images/Portada veggy - 28 abril 2021 v03.png',
  //  'assets/images/siempre fresco.png'
  //];
  ResponsiveApp? responsiveApp;

  @override
  Widget build(BuildContext context) {
    responsiveApp = ResponsiveApp(context);
    return BlocProvider(
        create: (_) => CarouselCubit(BannerRepository()),
        child: body(context));
  }

  FutureBuilder<List<CarouselModel>> body(BuildContext context) {
    return FutureBuilder(
        future: context.read<CarouselCubit>().getBannersList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            var imageSliders = generateImageTiles(snapshot.data);
            return Stack(
              children: [
                CarouselSlider(
                  items: imageSliders,
                  options: CarouselOptions(
                      scrollPhysics: isMobileAndTablet(context)
                          ? PageScrollPhysics()
                          : NeverScrollableScrollPhysics(),
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 18 / 8,
                      onPageChanged: (index, reason) {
                        // utilizar bloc
                        //se utiliza para saber cual imagen esta selecionada
                        // setState(() {
                        //   _current = index;
                        //   for (int i = 0; i < carouselImages.length; i++)
                        //     carouselImages[i].isSelected=(i == index)?true:false;
                        //
                        // });
                      }),
                  carouselController: _controller,
                ),
                //Positioned.fill(
                //    child: Center(
                //      //child: Text(
                //      //  carousel[_current].title,
                //      //  style: TextStyle(
                //      //    letterSpacing: responsiveApp.letterSpacingCarouselWidth,
                //      //    fontFamily: 'Electrolize',
                //      //    fontSize: responsiveApp.headline3,
                //      //  ),
                //      //),
                //    )),
                isMobileAndTablet(context)
                    ? Container()
                    : Positioned.fill(
                        child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            width: responsiveApp!.carouselContainerWidth,
                            height: responsiveApp!.carouselContainerHeight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // se generan los puntitos de cada imagen en el carousel
                              children: List.generate(
                                  imageSliders.length,
                                  (index) => InkWell(
                                        splashColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        onTap: () {
                                          _controller.animateToPage(index);
                                        },
                                        //tama;o y forma de cada puntito
                                        child: Container(
                                          width: responsiveApp!
                                              .carouselCircleContainerWidth,
                                          height: responsiveApp!
                                              .carouselCircleContainerHeight,
                                          margin: responsiveApp!
                                              .edgeInsetsApp.allSmallEdgeInsets,
                                          decoration: BoxDecoration(
                                              color: Colors.white,

                                              //carouselImages[index].isSelected
                                              //    ? Colors.white
                                              //    : Colors.blueGrey,
                                              shape: BoxShape.circle),
                                        ),
                                      )),
                            )),
                      ))
              ],
            );
          }
        });
  }

  // Stack body( List<CarouselModel> bannersList) {
  //   var imageSliders = generateImageTiles(bannersList);
  //   return
  // }

  //Utilizar en el block
  List<Widget> generateImageTiles(List<CarouselModel> bannersList) {
    return bannersList
        .map(
          (element) => ClipRRect(
            borderRadius:
                BorderRadius.circular(responsiveApp!.carouselRadiusWidth),
            child:
                Image(image: NetworkImage(element.image!), fit: BoxFit.cover),
          ),
        )
        .toList();
  }
}
