import 'package:flutter/material.dart';
import 'package:veggy/ui/widgets/product_card.dart';

class GridProductWidget extends StatelessWidget {
  GridProductWidget({required this.listProduct}) : super();
  final List listProduct;
  //TODO: La lista es de tipo producto, cambair los datos de prueva cuado ya tengamos los datos
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 24),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 0.6,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1),
          itemCount: 10,
          itemBuilder: (BuildContext ctx, index) {
            return ProductCard(
                title: 'Soya Chips',
                subtitle: 'CRC 3000',
                cornerIcon: Icons.shop,
                imageUrl: '',
                onPressCard: () {},
                onPressButton: () {});
          }),
    );
  }
}
